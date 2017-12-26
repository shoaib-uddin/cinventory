//
//  UserModel.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit
import Foundation

class UserModel{
    
    class func isUserLoggedIn() -> Bool{
        let prefs:UserDefaults = UserDefaults.standard
        let isLoggedIn:Int = prefs.integer(forKey: "ISLOGGEDIN") as Int
        return (isLoggedIn == 1);
    }
    
    class func isSessionExpired() -> Bool{
        let prefs:UserDefaults = UserDefaults.standard
        let ISEXPIREUSER:Int = prefs.integer(forKey: "ISEXPIREUSER") as Int
        return (ISEXPIREUSER == 1);
    }
    
    
    class func setLoginUser(_ response: LoggedInModel){
        
        let prefs:UserDefaults = UserDefaults.standard
        prefs.set(1, forKey: "ISLOGGEDIN")
        prefs.set(0, forKey: "ISEXPIREUSER")
        prefs.set(response.toJsonString(), forKey: "LoggedInInfo")
        prefs.synchronize();
        
    }
    
    class func GetInfo() -> LoggedInModel!
    {
        let prefs:UserDefaults = UserDefaults.standard
        let LoggedInfo =  prefs.object(forKey: "LoggedInInfo") as! String!;
        let isLoggedIn =  prefs.integer(forKey: "ISLOGGEDIN");
        if(isLoggedIn == 1){
            let model = LoggedInModel(json: LoggedInfo);
            return model;
        }
        return nil;
    }
    
    
    
    class func setLoggedOutUser(){
        let prefs:UserDefaults = UserDefaults.standard
        prefs.set(0, forKey: "ISLOGGEDIN")
        prefs.removeObject(forKey: "LoggedInInfo");
        prefs.synchronize();
    }
    
    class func setExpireUser(){
        let prefs:UserDefaults = UserDefaults.standard
        prefs.set(0, forKey: "ISLOGGEDIN")
        prefs.set(1, forKey: "ISEXPIREUSER")
        prefs.removeObject(forKey: "LoggedInInfo");
        prefs.synchronize();
    }
    
    
    class func setKey(_ KeyName : String , KeyValue : String){
        let prefs:UserDefaults = UserDefaults.standard
        prefs.set(KeyValue, forKey: KeyName)
        prefs.synchronize();
    }
    
    class func getKey(_ KeyName : String) -> String!{
        let prefs:UserDefaults = UserDefaults.standard
        let KeyValue =  prefs.object(forKey: KeyName);
        if(KeyValue != nil ){
            return KeyValue! as! String;
        }
        return nil;
        
    }
    
    
    
}
