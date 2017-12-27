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
    
    
    // variables
    var Id: NSNumber?
    
    
    
    
    var VehicleSourceId: NSNumber!
    var VehicleSource: [Vendor] = [Vendor]()
    
    
    
    
    
    
    var Buyers: [Vendor] = [Vendor]()
    
    
    
    var OdoScale: Bool? = false
    
    var EmissionDone: Bool? = false
    
    
    
    var EmissionDate: String? = ""
    
    
    
    
    
    
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    
    
    
  
    
    
    
    var : String? = ""
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    
    
    
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    
    var AvailablityId: NSNumber!
    var AvailabilityStatus: [InventoryDropdowns] = [InventoryDropdowns]()
    
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofDetail: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionType: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionStates: [InventoryDropdowns] = [InventoryDropdowns]()
    
    var BodyFamilyId: NSNumber!
    var : [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionTypeId: NSNumber!
    
    
    var BuyerId: NSNumber!
    var BuyerIsVendor: Bool? = false
    var BuyNotes: String? = ""
    
    var : NSNumber!
    
    var : NSNumber!
    
    var : NSNumber!
    
    var : NSNumber!
    
    var RoofColorId: NSNumber!
    
    var StoreId: NSNumber!
    
    var RoofDetailId: NSNumber!
    
    var : NSNumber!
    
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
            
            Section("General Info")
            
            <<< PushRow<String>() {
                $0.title = "Availability"
                $0.options = data.AvailabilityStatus.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.AvailabilityStatus, id: data.AvailablityId)
                $0.selectorTitle = "Choose Availability"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Store Name"
                $0.options = data.StoreName.map { $0.StoreName! }
                $0.value = returnNameOfDropdown(obj: data.StoreName, id: data.StoreId)
                $0.selectorTitle = "Choose Store Name"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< TextRow() { $0.title = "Actual Location";  $0.value = "\(data.ActualLocation!)" }
            
            <<< PushRow<String>() {
                $0.title = "Landing Location"
                $0.options = data.Locations.map { $0.Street! }
                $0.value = returnNameOfDropdown(obj: data.Locations, id: data.LandingLocation)
                $0.selectorTitle = "Choose Landing Location"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
            }
            
            <<< SwitchRow() { $0.title = "Key Available" ; $0.value = data.KeyAvailable }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Category"
                $0.selectorTitle = "Condition Category"
                $0.options = ["New", "Used"]
                $0.value = (data.BuyCategory)! ? "Used" : "New"
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
                }
            
            <<< SwitchRow() { $0.title = "Is Drivable" ; $0.value = data.DriveAble }
            
            <<< PushRow<String>() {
                $0.title = "Body Type"
                $0.options = data.BodyType.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.BodyType, id: data.BodyTypeId)
                $0.selectorTitle = "Choose Body Type"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Doors"
                $0.options = data.Doors.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.Doors, id: data.DoorId)
                $0.selectorTitle = "Choose Doors"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< IntRow() { $0.title = "Cylenders"; $0.value = Int(truncating: data.Cylenders) }
            
            +++ Section()
            
            <<< PushRow<String>() {
                $0.title = "Exterior Color"
                $0.options = data.ExteriorColor.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.ExteriorColor, id: data.ExteriorColorId)
                $0.selectorTitle = "Choose Exterior Color"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Interior Color"
                $0.options = data.InteriorColor.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.InteriorColor, id: data.InteriorColorId)
                $0.selectorTitle = "Choose Interior Color"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< TextRow() { $0.title = "OEM Color";   $0.value = "\(data.OemColor!)" }
            
            +++ Section("Exhaust")
            
            <<< PushRow<String>() {
                $0.title = "Transmission"
                $0.options = data.Transmission.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.Transmission, id: data.TransmissionId)
                $0.selectorTitle = "Choose Transmission"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Fuel Type"
                $0.options = data.FuelType.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.FuelType, id: data.FuelTypeId)
                $0.selectorTitle = "Choose Fuel Type"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Drive Train"
                $0.options = data.DriveTrain.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.DriveTrain, id: data.DriveTrainId)
                $0.selectorTitle = "Choose Drive Train"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Body Family"
                $0.options = data.BodyFamily.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.BodyFamily, id: data.BodyFamilyId)
                $0.selectorTitle = "Choose Body Family"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Unibody Code"
                $0.options = data.UniCode.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.UniCode, id: data.UniCodeId)
                $0.selectorTitle = "Choose Unibody Code"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< PushRow<String>() {
                $0.title = "Vehicle Source"
                $0.options = data.VehicleSource.map { $0.Name! }
                $0.value = returnNameOfDropdown(obj: data.VehicleSource, id: data.VehicleSourceId)
                $0.selectorTitle = "Choose Vehicle Source"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
                }
            
            <<< SwitchRow() { $0.title = "Is Luxury Vehicle" ; $0.value = data.LuxuryVehicle }
            
            +++ Section()
            
            
            <<< TextRow() { $0.title = "Make";  $0.value = "\(data.Make!)" }
            <<< TextRow() { $0.title = "Model"; $0.value = "\(data.Model!)" }
            <<< TextRow() { $0.title = "VIN";   $0.value = "\(data.Vin!)" }
            
            <<< IntRow() { $0.title = "Miles"; $0.value = Int(truncating: data.MilesIn) }
            <<< SwitchRow() { $0.title = "Miles Exempt" ; $0.value = data.MilesExempt }
            
            
        
            // Date Row is pending
            <<< DateRow() { $0.title = "Year";  $0.value = Date() }
            
            
            
            
            
            
            
            <<< SwitchRow() { $0.title = "Is Sunroof" ; $0.value = data.SunRoof }
            <<< SwitchRow() { $0.title = "Is Luxury" ; $0.value = data.IsLuxury }
           
            
            
            
            <<< LabelRow () {
                $0.title = "\(data.Make!)"
                $0.value = "tap the row"
                }
                .onCellSelection { cell, row in
                    row.title = (row.title ?? "") + " 🇺🇾 "
                    row.reload() // or row.updateCell()
            }
            
            
            
            
            <<< CheckRow() {
                $0.title = "CheckRow"
                $0.value = true
            }
            
            <<< SwitchRow() {
                $0.title = "SwitchRow"
                $0.value = true
            }
            
            <<< SliderRow() {
                $0.title = "SliderRow"
                $0.value = 5.0
            }
            
            <<< StepperRow() {
                $0.title = "StepperRow"
                $0.value = 1.0
            }
            
            +++ Section("SegmentedRow examples")
            
            <<< SegmentedRow<String>() { $0.options = ["One", "Two", "Three"] }
            
            
            
            <<< SegmentedRow<String>(){
                $0.title = "SegmentedRow"
                $0.options = ["One", "Two"]
                }.cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
            }
            
            <<< SegmentedRow<String>(){
                $0.options = ["One", "Two", "Three", "Four"]
                $0.value = "Three"
                }.cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
            }
            
            
            
            +++ Section("Selectors Rows Examples")
            
            <<< ActionSheetRow<String>() {
                $0.title = "ActionSheetRow"
                $0.selectorTitle = "Your favourite player?"
                $0.options = ["Diego Forlán", "Edinson Cavani", "Diego Lugano", "Luis Suarez"]
                $0.value = "Luis Suarez"
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
        }
        
        
        
        
        
        
        
        
        
        
        
        form +++ Section("Generic picker")
            
            <<< PickerRow<String>("Picker Row") { (row : PickerRow<String>) -> Void in
                
                row.options = []
                for i in 1...10{
                    row.options.append("option \(i)")
                }
            }
            
            <<< PickerInputRow<String>("Picker Input Row"){
                $0.title = "Options"
                $0.options = []
                for i in 1...10{
                    $0.options.append("option \(i)")
                }
                $0.value = $0.options.first
            }
            
            +++ Section("FieldRow examples")
            
            <<< TextRow() {
                $0.title = "TextRow"
                $0.placeholder = "Placeholder"
            }
            
            <<< DecimalRow() {
                $0.title = "DecimalRow"
                $0.value = 5
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            
            <<< URLRow() {
                $0.title = "URLRow"
                $0.value = URL(string: "http://xmartlabs.com")
            }
            
            <<< PhoneRow() {
                $0.title = "PhoneRow (disabled)"
                $0.value = "+598 9898983510"
                $0.disabled = true
            }
            
            <<< NameRow() {
                $0.title =  "NameRow"
            }
            
            <<< PasswordRow() {
                $0.title = "PasswordRow"
                $0.value = "password"
            }
            
            <<< IntRow() {
                $0.title = "IntRow"
                $0.value = 2015
            }
            
            <<< EmailRow() {
                $0.title = "EmailRow"
                $0.value = "a@b.com"
            }
            
            <<< TwitterRow() {
                $0.title = "TwitterRow"
                $0.value = "@xmartlabs"
            }
            
            <<< AccountRow() {
                $0.title = "AccountRow"
                $0.placeholder = "Placeholder"
            }
            
            <<< ZipCodeRow() {
                $0.title = "ZipCodeRow"
                $0.placeholder = "90210"
        }
        
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
