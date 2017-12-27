//
//  InvBasicVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit
import Eureka

class InvBasicVC: FormViewController {
    //
    // IBOutlets
    
    
    // variables
    var Id: NSNumber?
    var StoreName: [StoreLookup] = [StoreLookup]()
    
    var LandingLocation: NSNumber!
    var Locations: [InventoryLandingLocations] = [InventoryLandingLocations]()
    
    
    var VehicleSourceId: NSNumber!
    var VehicleSource: [Vendor] = [Vendor]()
    
    var KeyAvailable: Bool? = false
    
    var AvailablityId: NSNumber!
    
    var BodyTypeId: NSNumber!
    
    var Buyers: [Vendor] = [Vendor]()
    
    
    
    var OdoScale: Bool? = false
    
    var EmissionDone: Bool? = false
    
    
    
    var EmissionDate: String? = ""
    
    var BodyType:  [InventoryDropdowns]!
    var ExteriorColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofColor: [InventoryDropdowns] = [InventoryDropdowns]()
    var InteriorColor: [InventoryDropdowns] = [InventoryDropdowns]()
    
    
    
    var DoorId: NSNumber!
    
    
    
    var UniCodeId: String? = ""
    var UniCode: [InventoryDropdowns] = [InventoryDropdowns]()
    
    
    
    var FuelType: [InventoryDropdowns] = [InventoryDropdowns]()
    var DriveTrain: [InventoryDropdowns] = [InventoryDropdowns]()
    var Doors: [InventoryDropdowns] = [InventoryDropdowns]()
    
    
    var AvailabilityStatus: [InventoryDropdowns] = [InventoryDropdowns]()
    
    var Transmission: [InventoryDropdowns] = [InventoryDropdowns]()
    var RoofDetail: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionType: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionStates: [InventoryDropdowns] = [InventoryDropdowns]()
    
    var BodyFamilyId: NSNumber!
    var BodyFamily: [InventoryDropdowns] = [InventoryDropdowns]()
    var EmissionTypeId: NSNumber!
    
    
    var BuyerId: NSNumber!
    var BuyerIsVendor: Bool? = false
    var BuyNotes: String? = ""
    
    var DriveTrainId: NSNumber!
    
    var ExteriorColorId: NSNumber!
    
    var FuelTypeId: NSNumber!
    
    var InteriorColorId: NSNumber!
    
    var RoofColorId: NSNumber!
    
    var StoreId: NSNumber!
    
    var RoofDetailId: NSNumber!
    
    var TransmissionId: NSNumber!
    
    override func viewDidLoad() {
        //
        super.viewDidLoad();
        
    }
    
    func setData(data: EnInventoryBasicTab){
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
        form +++
            
            Section()
            
            <<< TextRow() { $0.title = "Make";  $0.value = "\(data.ActualLocation!)" }
            <<< TextRow() { $0.title = "Make";  $0.value = "\(data.Make!)" }
            <<< TextRow() { $0.title = "Model"; $0.value = "\(data.Model!)" }
            <<< TextRow() { $0.title = "VIN";   $0.value = "\(data.Vin!)" }
            
            <<< IntRow() { $0.title = "Miles"; $0.value = Int(truncating: data.MilesIn) }
            <<< SwitchRow() { $0.title = "Miles Exempt" ; $0.value = data.MilesExempt }
            
            <<< IntRow() { $0.title = "Cylenders"; $0.value = Int(truncating: data.Cylenders) }
        
            // Date Row is pending
            <<< DateRow() { $0.title = "Year";  $0.value = Date() }
            
            
            <<< TextRow() { $0.title = "OEM Color";   $0.value = "\(data.OemColor!)" }
            
            
            <<< SwitchRow() { $0.title = "Is Buy Category" ; $0.value = data.BuyCategory }
            <<< SwitchRow() { $0.title = "Is Drivable" ; $0.value = data.DriveAble }
            <<< SwitchRow() { $0.title = "Is Sunroof" ; $0.value = data.SunRoof }
            <<< SwitchRow() { $0.title = "Is Luxury" ; $0.value = data.IsLuxury }
            <<< SwitchRow() { $0.title = "Is Luxury Vehicle" ; $0.value = data.LuxuryVehicle }
            
            
            
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
