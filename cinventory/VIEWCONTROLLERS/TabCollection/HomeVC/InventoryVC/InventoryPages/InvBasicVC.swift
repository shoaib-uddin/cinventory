//
//  InvBasicVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//
//  http://ec2-54-211-238-136.compute-1.amazonaws.com/Inventory/InventoryBasicTab?invId=548
//  a.khan7  mykingdom12345

import UIKit
import Eureka

class InvBasicVC: FormViewController {
    //
    // IBOutlets
    
    var enableEditOverlay: EnableEditOverlay!;
    var disabled: Bool = false;
    
    override func viewDidLoad() {
        //
        super.viewDidLoad();
        
        
        
        
        
    }
    
    
    
    
    func returnNameOfDropdown(obj: [InventoryDropdowns], id: NSNumber) -> String?{
        for item in obj {
            if(Int(truncating: item.Id!) == Int(truncating: id)){
                return item.Name!
            }
        }
        
        return "";
    }
    
    func returnNameOfDropdown(obj: [StoreLookup], id: NSNumber) -> String?{
        for item in obj {
            if(Int(truncating: item.StoreId!) == Int(truncating: id)){
                return item.StoreName!
            }
        }
        
        return "";
    }
    
    func returnNameOfDropdown(obj: [InventoryLandingLocations], id: NSNumber) -> String?{
        for item in obj {
            if(Int(truncating: item.Id!) == Int(truncating: id)){
                return item.Street!
            }
        }
        
        return "";
    }
    
    func returnNameOfDropdown(obj: [Vendor], id: NSNumber) -> String?{
        for item in obj {
            if(Int(truncating: item.Id!) == Int(truncating: id)){
                return item.FirstName!
            }
        }
        
        return "";
    }
    
    
    
    
    func setData(data: EnInventoryBasicTab){
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
        var inventoryDropDownStrings: [String] = [String]();
        for item in data.AvailabilityStatus {
            if !inventoryDropDownStrings.contains(item.Name!) { inventoryDropDownStrings.append(item.Name!) }
        }
        
        
        
        
        
        
        form +++
            
            Section()
            
            <<< SwitchRow("editingTag") { $0.title = "Enable Editing" ; $0.value = self.disabled }
            
            +++ Section("General Info")
            
            <<< PushRow<String>() {
                $0.title = "Availability"
                $0.options = data.AvailabilityStatus.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.AvailabilityStatus, id: data.AvailablityId)
                $0.selectorTitle = "Choose Availability"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Store Name"
                $0.options = data.StoreName.map { $0.StoreName! }
                $0.value = returnNameOfDropdown(obj: data.StoreName, id: data.StoreId)
                $0.selectorTitle = "Choose Store Name"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< TextRow() { $0.title = "Actual Location";  $0.value = "\(data.ActualLocation!)"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            <<< PushRow<String>() {
                $0.title = "Landing Location"
                $0.options = data.Locations.map { $0.Street! }
                $0.value = returnNameOfDropdown(obj: data.Locations, id: data.LandingLocation)
                $0.selectorTitle = "Choose Landing Location"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
            }
            
            <<< SwitchRow() { $0.title = "Key Available" ; $0.value = data.KeyAvailable
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Category"
                $0.selectorTitle = "Condition Category"
                $0.options = ["New", "Used"]
                $0.value = (data.BuyCategory)! ? "Used" : "New"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
                }
            
            <<< SwitchRow() { $0.title = "Is Drivable" ; $0.value = data.DriveAble
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            
            <<< PushRow<String>() {
                $0.title = "Body Type"
                $0.options = data.BodyType.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.BodyType, id: data.BodyTypeId)
                $0.selectorTitle = "Choose Body Type"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
//            <<< PushRow<String>() {
//                $0.title = "Doors"
//                $0.options = data.Doors.map { $0.Name! }
//                $0.value = returnNameOfDropdown(obj: data.Doors, id: data.DoorId)
//                $0.selectorTitle = "Choose Doors"
//                $0.disabled = Condition.function(["editingTag"], { form in
//                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
//                })
//                }.onPresent { from, to in
//                    to.dismissOnSelection = true
//                    to.dismissOnChange = true
//                }
            
//            <<< IntRow() { $0.title = "Cylenders"; $0.value = Int(truncating: data.Cylenders)
//                $0.disabled = Condition.function(["editingTag"], { form in
//                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
//                })
//            }
            
            +++ Section()
            
            <<< PushRow<String>() {
                $0.title = "Exterior Color"
                $0.options = data.ExteriorColor.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.ExteriorColor, id: data.ExteriorColorId)
                $0.selectorTitle = "Choose Exterior Color"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Interior Color"
                $0.options = data.InteriorColor.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.InteriorColor, id: data.InteriorColorId)
                $0.selectorTitle = "Choose Interior Color"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< TextRow() { $0.title = "OEM Color";   $0.value = "\(data.OemColor!)"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            +++ Section("Exhaust")
            
            <<< PushRow<String>() {
                $0.title = "Transmission"
                $0.options = data.Transmission.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.Transmission, id: data.TransmissionId)
                $0.selectorTitle = "Choose Transmission"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Fuel Type"
                $0.options = data.FuelType.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.FuelType, id: data.FuelTypeId)
                $0.selectorTitle = "Choose Fuel Type"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Drive Train"
                $0.options = data.DriveTrain.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.DriveTrain, id: data.DriveTrainId)
                $0.selectorTitle = "Choose Drive Train"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Body Family"
                $0.options = data.BodyFamily.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.BodyFamily, id: data.BodyFamilyId)
                $0.selectorTitle = "Choose Body Family"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
//            <<< PushRow<String>() {
//                $0.title = "Unibody Code"
//                $0.options = data.UniCode.map { $0.Name! }
//                $0.value = returnNameOfDropdown(obj: data.UniCode, id: data.UniCodeId!)
//                $0.selectorTitle = "Choose Unibody Code"
//                }.onPresent { from, to in
//                    to.dismissOnSelection = true
//                    to.dismissOnChange = true
//                }
            
            <<< PushRow<String>() {
                $0.title = "Vehicle Source"
                $0.options = data.VehicleSource.map { $0.FirstName! }
                $0.value = returnNameOfDropdown(obj: data.VehicleSource, id: data.VehicleSourceId)
                $0.selectorTitle = "Choose Vehicle Source"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< SwitchRow() { $0.title = "Is Luxury Vehicle" ; $0.value = data.LuxuryVehicle
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            +++ Section()
            
            <<< SwitchRow() { $0.title = "Miles Exempt" ; $0.value = data.MilesExempt
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            <<< IntRow() { $0.title = "Miles"; $0.value = Int(truncating: data.MilesIn)
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            <<< ActionSheetRow<String>() {
                $0.title = "Measures In"
                $0.selectorTitle = "Condition Measures In"
                $0.options = ["Miles", "KM"]
                $0.value = (data.OdoScale)! ? "Miles" : "KM"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
                }
            
            +++ Section()
            
            <<< SwitchRow() { $0.title = "Is Sunroof" ; $0.value = data.SunRoof
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            <<< PushRow<String>() {
                $0.title = "Roof Details"
                $0.options = data.RoofDetail.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.RoofDetail, id: data.RoofDetailId)
                $0.selectorTitle = "Choose Roof Color"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Roof Color"
                $0.options = data.RoofColor.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.RoofColor, id: data.RoofColorId)
                $0.selectorTitle = "Choose Roof Color"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            +++ Section()
            
            <<< SwitchRow() { $0.title = "Is Emission Done" ; $0.value = data.EmissionDone
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            // Dates needs to be done
            <<< DateRow() { $0.title = "Emission Date";  $0.value = Date()
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
            }
            
            <<< PushRow<String>() {
                $0.title = "Emission State"
                $0.options = data.EmissionStates.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.EmissionStates, id: 0)
                $0.selectorTitle = "Choose Emission State"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            +++ Section()
            
            <<< ActionSheetRow<String>() {
                $0.title = "Buyer"
                $0.selectorTitle = "Condition Buyer"
                $0.options = ["Vendor", "Employee"]
                $0.value = (data.BuyerIsVendor)! ? "Vendor" : "Employee"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
                }
            
            <<< PushRow<String>() {
                $0.title = "Buyer Name"
                $0.options = data.Buyers.map { $0.FirstName! }
                $0.value = returnNameOfDropdown(obj: data.Buyers, id: data.BuyerId)
                $0.selectorTitle = "Choose Buyer Name"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< TextRow() { $0.title = "Buyer Notes";  $0.value = "\(data.BuyNotes!)"
                $0.disabled = Condition.function(["editingTag"], { form in
                    return !((form.rowBy(tag: "editingTag") as? SwitchRow)?.value ?? false)
                })
                }
                
        
        
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
