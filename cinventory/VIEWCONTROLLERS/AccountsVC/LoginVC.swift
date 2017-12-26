//
//  LoginVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    //
    // IBOutlets
    @IBOutlet weak var tbxUserName: UITextField!
    @IBOutlet weak var tbxPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var newAcoountButton: UIButton!
    
    // variables
    
    override func viewDidLoad() {
        //
        // StyleLayout called
        
        tbxUserName.setCons(icon: "user-seperator@1x", showIcon: true);
        tbxPassword.setCons(icon: "lock@1x", showIcon: true);
        loginButton.setCons();
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        tbxUserName.text = "a.khan7";
        tbxPassword.text = "nopass@0";
    }
    
    @IBAction func btnForgetPassswordTapped(sender: UIButton) {
        
    }
    
    @IBAction func btnSignupTapped(sender: UIButton) {
        
    }
    
    
    //Login Events
    @IBAction func LoginPressed(sender: UIButton) {
        
        // Initializing Items
        let UserName: String = tbxUserName.text!  as String;
        let Password: String = tbxPassword.text! as String;

        //doing Validations
        if(!Validate.Required(UserName, Label: "User Name")){return;}
        if(!Validate.Required(Password, Label: "Password")){return;}
        
        Inventory.Login(UserName, Password) { (callback) in
            if(callback){
                PageRedirect.redirectToDashboard(view: self);
            }else{
                UtilityHelper.AlertMessage("Invalid username or password!");
            }
        }
        
        
    }
    
}
