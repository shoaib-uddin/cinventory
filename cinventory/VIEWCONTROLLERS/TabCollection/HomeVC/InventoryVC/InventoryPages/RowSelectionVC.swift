//
//  RowSelectionVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit
import Eureka


class RowsExampleViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
        form +++
            
            Section()
            
            <<< LabelRow () {
                $0.title = "LabelRow"
                $0.value = "tap the row"
                }
                .onCellSelection { cell, row in
                    row.title = (row.title ?? "") + " 🇺🇾 "
                    row.reload() // or row.updateCell()
            }
            
            
            <<< DateRow() { $0.value = Date(); $0.title = "DateRow" }
            
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
