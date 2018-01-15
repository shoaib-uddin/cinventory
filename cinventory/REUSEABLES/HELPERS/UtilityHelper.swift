//
//  UtilityHelper.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import LKAlertController
import AVFoundation

class UtilityHelper
{
    class func ShowLoader(_ title:String = "Loading") {
        
        if ARSLineProgress.shown { return }
        
            ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
                print("Showed with completion block")
            }
        
        
        
//        let window: UIWindow! = UIApplication.shared.keyWindow;
//        //MBProgressHUD.hideAllHUDs(for: window, animated: true)
//        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: window, animated: true)
//        hud.label.text = title;
//        hud.show(animated: true);
        
    }
    
    class func HideLoader() {
        
        if !ARSLineProgress.shown { return }
        DispatchQueue.main.async {
            ARSLineProgress.hideWithCompletionBlock({ () -> Void in
                print("Hidden with completion block")
            })
        }
        
        
//        let window: UIWindow! = UIApplication.shared.keyWindow
//        MBProgressHUD.hide(for: window, animated: true);
    }
    
    class func AlertMessage(_ msg: String) {
        Alert(title: nil, message: msg)
            .addAction("Ok")
            .show()
    }
    
    class func AlertMessagewithCallBack(_ msg: String,  success: @escaping () -> Void) {
        
        
        Alert(title: nil, message: msg).addAction("OK", style: .default) { (_) -> Void in
            success();
            }.show();
        
    }
    
    class func excludeAuthorization(_ ReqUrl:String)-> Bool {
        var ret:Bool=false;
        let ExcludeElements:[String] = [
            //"login",
        ]
        
        let check=ExcludeElements.filter({ el in ReqUrl.range(of: el) != nil  });
        ret=(check.count > 0);
        return ret;
    }
    
    class func getPlistContent(name: String) -> [[String: Any]]{
        
        var plist: [[String: Any]]!;
        
        if let path = Bundle.main.path(forResource: name, ofType: "plist") {
            
            //If your plist contain root as Array
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                //print(array);
                plist = array;
            }
            
        }
        
        return plist;
        
    }
    
}
