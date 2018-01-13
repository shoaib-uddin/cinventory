//
//  InvOptionsVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit
import Eureka



class InvOptionsVC: FormViewController {
    //
    // IBOutlets
    
    // variables
    var collectionArray: [[String:Any]] = [[ : ]];
    var collectionArrayGeneral: [[String:Any]] = [[ : ]];
    var collectionArrayExterior: [[String:Any]] = [[ : ]];
    let continents = ["All", "Basic", "Technology", "Advance", "None"]
    
    override func viewDidLoad() {
        //
        super.viewDidLoad();
        self.setData();
        
    }
    
    
    
    
    
    
    func setData(){
        
        
        
            form +++ SelectableSection<ImageCheckRow<String>>() { section in
                section.header = HeaderFooterView(title: "Standard selection options")
            }
        
            for option in continents {
                form.last! <<< ImageCheckRow<String>(option){ lrow in
                    lrow.title = option
                    lrow.selectableValue = option
                    lrow.value = nil
                    
                }
            }
        
        // invOptionsChecklist
        self.collectionArray = UtilityHelper.getPlistContent(name: "invOptionsChecklist");
        
        for i in 0..<self.collectionArray.count{
            
            //print(self.collectionArray[i]);
            
            form +++ SelectableSection<ImageCheckRow<String>>(self.collectionArray[i]["Name"] as! String, selectionType: .multipleSelection)
            
            let array = self.collectionArray[i]["Data"] as! [[ String : Any ]];
            for j in 0..<array.count{
                
                let name = array[j]["Name"] as! String;
                let id = array[j]["ID"] as! String;
                
                //print(name, id);
                form.last! <<< ImageCheckRow<String>(name){ lrow in
                    lrow.title = name
                    lrow.selectableValue = id
                    lrow.value = nil
                    }.cellSetup { cell, _ in
                        cell.trueImage = UIImage(named: "selectedRectangle")!
                        cell.falseImage = UIImage(named: "unselectedRectangle")!
                        cell.accessoryType = .checkmark
                }
                
            }
            
            
            
        }
       
        
            
//            form +++ SelectableSection<ImageCheckRow<String>>("General Options", selectionType: .multipleSelection)
//            self.collectionArrayGeneral = UtilityHelper.getPlistContent(name: "invOptionsGeneralChecklist");
//            for option in self.collectionArrayGeneral {
//                let name = option["Name"] as! String;
//                let id = option["ID"] as! String;
//
//                form.last! <<< ImageCheckRow<String>(name){ lrow in
//                lrow.title = name
//                lrow.selectableValue = id
//                lrow.value = nil
//                }.cellSetup { cell, _ in
//                    cell.trueImage = UIImage(named: "selectedRectangle")!
//                    cell.falseImage = UIImage(named: "unselectedRectangle")!
//                    cell.accessoryType = .checkmark
//                }
//            }
//
//            form +++ SelectableSection<ImageCheckRow<String>>("Exterior Options", selectionType: .multipleSelection)
//            self.collectionArrayGeneral = UtilityHelper.getPlistContent(name: "invOptionsExteriorChecklist");
//            for option in self.collectionArrayGeneral {
//                let name = option["Name"] as! String;
//                let id = option["ID"] as! String;
//
//                form.last! <<< ImageCheckRow<String>(name){ lrow in
//                    lrow.title = name
//                    lrow.selectableValue = id
//                    lrow.value = nil
//                    }.cellSetup { cell, _ in
//                        cell.trueImage = UIImage(named: "selectedRectangle")!
//                        cell.falseImage = UIImage(named: "unselectedRectangle")!
//                        cell.accessoryType = .checkmark
//                }
//            }
        
            
        
        
        
    }
    
    override func valueHasBeenChanged(for row: BaseRow, oldValue: Any?, newValue: Any?) {
        if row.section === form[0] {
            let topOption = (row.section as! SelectableSection<ImageCheckRow<String>>).selectedRow()?.baseValue ?? "No row selected";
            
            switch topOption as! String {
            case continents[0]:
                setAllOptions();
            case continents[1]:
                setBasicOptions();
            case continents[2]:
                setTechnologyOptions();
            case continents[3]:
                setAdvanceOptions()
            case continents[4]:
                setNoneOptions()
            default:
                print("Some other character")
            }
            
            
            
        }
        else if row.section === form[1] {
            print("Mutiple Selection:\((row.section as! SelectableSection<ImageCheckRow<String>>).selectedRows().map({$0.baseValue}))")
        }
    }
    
    fileprivate func setAllOptions(){
        
        for i in 1...self.collectionArray.count{
            
            form[i].forEach { (row) in
                //
                row.baseValue = self.collectionArray[(row.indexPath?.row)!]["ID"];
                //print(row.baseValue!);
                
            }
            
            
        }
        tableView.reloadData();
        
        
        
        
        
    }
    
    fileprivate func setNoneOptions(){
        
        for i in 1...self.collectionArray.count{
            
            form[i].forEach { (row) in
                //
                row.baseValue = nil
                //print(row.baseValue!);
                
            }
            
            
        }
        tableView.reloadData();
        
        
        
        
        
    }
    
    fileprivate func setBasicOptions(){
        
    }
    
    fileprivate func setTechnologyOptions(){
        
        for i in 1...self.collectionArray.count{
            
            form[i].forEach { (row) in
                //
                if(i % 2 == 0){
                    row.baseValue = self.collectionArray[(row.indexPath?.row)!]["ID"];
                }else{
                    row.baseValue = nil
                }
                
                //print(row.baseValue!);
                
            }
            
            
        }
        tableView.reloadData();
        
    }
    
    fileprivate func setAdvanceOptions(){
        
        for i in 1...self.collectionArray.count{
            
            form[i].forEach { (row) in
                //
                if(i % 2 != 0){
                    row.baseValue = self.collectionArray[(row.indexPath?.row)!]["ID"];
                }else{
                    row.baseValue = nil
                }
                //print(row.baseValue!);
                
            }
            
            
        }
        tableView.reloadData();
        
    }
    
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
