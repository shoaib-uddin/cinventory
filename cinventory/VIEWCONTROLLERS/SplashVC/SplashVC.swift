//
//  SplashVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class SplashVC: UIViewController {
    //
    override func viewDidLoad() {
        //
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                //
                self.showNextViewController();
            }
        }
        
    }
    
    func showNextViewController(){
        
        if(!UserModel.isUserLoggedIn()){
            PageRedirect.redirectToLogin(view: self);
        }
        else
        {
            PageRedirect.redirectToDashboard(view: self);
        }
        
    }
    
    
    
    
    
    
    
}
