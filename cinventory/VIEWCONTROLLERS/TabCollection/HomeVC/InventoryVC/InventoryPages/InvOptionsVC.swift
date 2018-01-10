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
    var collectionArrayGeneral: [[String:Any]] = [[ : ]];
    var collectionArrayExterior: [[String:Any]] = [[ : ]];
    
    override func viewDidLoad() {
        //
        super.viewDidLoad();
        self.setData();
        
    }
    
    
    
    
    
    
    func setData(){
        
            let continents = ["All", "Basic", "Technology", "Advance"]
        
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
        
        
        
        
            
            form +++ SelectableSection<ImageCheckRow<String>>("General Options", selectionType: .multipleSelection)
            self.collectionArrayGeneral = UtilityHelper.getPlistContent(name: "invOptionsGeneralChecklist");
            for option in self.collectionArrayGeneral {
                let name = option["Name"] as! String;
                let id = option["ID"] as! String;
                
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
        
            form +++ SelectableSection<ImageCheckRow<String>>("Exterior Options", selectionType: .multipleSelection)
            self.collectionArrayGeneral = UtilityHelper.getPlistContent(name: "invOptionsExteriorChecklist");
            for option in self.collectionArrayGeneral {
                let name = option["Name"] as! String;
                let id = option["ID"] as! String;
                
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
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
