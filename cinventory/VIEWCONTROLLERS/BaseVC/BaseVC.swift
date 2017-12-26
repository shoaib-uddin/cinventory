//
//  BaseVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // USE FOR CHANGE COLOR OF TOP NAVIGATION BAR
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 194/255, blue: 228/255, alpha: 1.0)
        self.navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
    }

    
    

}
