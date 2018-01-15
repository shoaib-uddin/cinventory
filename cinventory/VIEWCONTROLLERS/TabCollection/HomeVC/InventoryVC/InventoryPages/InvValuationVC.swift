//
//  InvValuationVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class InvValuationVC: FormViewController {
    //
    // IBOutlets
    
    // variables
    var collectionArray: [[String:Any]] = [[ : ]];
    
    override func viewDidLoad() {
        //
        super.viewDidLoad();
        self.setData();
        
    }
    
    func setData(){
        
        self.collectionArray = UtilityHelper.getPlistContent(name: "invValuationChecklist");
        // invOptionsChecklist
        
        for i in 0..<self.collectionArray.count{
            
            //print(self.collectionArray[i]);
            let name = self.collectionArray[i]["Name"] as! String;
            
            form +++ Section(name);
            
            let array = self.collectionArray[i]["Data"] as! [ String ];
            for j in 0..<array.count{
                
                let title = String(describing: array[j]);
                let id = String(describing: j);
                
                //print(name, id);
                form.last! <<< TextRow() { $0.title = title;  $0.value = ""; $0.placeholder = "Enter \(title)"}
                
            }
            
            
            
        }
        
    }
    
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
}
