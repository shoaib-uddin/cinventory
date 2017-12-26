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
    var invListModel: InvListModel!;
    
    override func viewDidLoad() {
        //
        
    }
    
    func setData(invListModel: InvListModel){
        
        print("From Basic View");
        self.invListModel = invListModel
        print(self.invListModel);
        
        
    }
    
    
    
    
    
}
