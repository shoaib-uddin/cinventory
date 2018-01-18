//
//  PageRedirectHelper.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class PageRedirect {
    // page redirect helpers
    
    class func NavigateToViewController(_self:UIViewController,viewControllerid: String){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: viewControllerid) as UIViewController
        _self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func redirectToLogin(view: UIViewController){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        view.present(destination, animated: true, completion: nil);
//        view.navigationController?.present(destination, animated: true, completion: {
//            view.navigationController?.dismissDetail();
//        })
    }
    
    class func redirectToDashboard(view: UIViewController)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! UITabBarController
        view.present(destination, animated: true, completion: nil);
    }
    
    class func redirectToSingleInv(view: UIViewController, inv: InvListModel){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "InventoryVC") as! InventoryVC
        destination.invListModel = inv;
        view.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func redirectToSingleInvWithBasicData(view: UIViewController, inv: InvListModel, basicData: EnInventoryBasicTab){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "InventoryVC") as! InventoryVC
        destination.invListModel = inv;
        destination.newRecord = true;
        destination.enInventoryBasicTab = basicData;
        view.navigationController?.pushViewController(destination, animated: true)
        
        
    }
    
    class func redirectToSingleViewFromQR(view: UIViewController, inv: InvListModel, index: Int){
        
        var controller: UIViewController!;
        
        outerloop: for item in (view.navigationController?.viewControllers)! {
            
            if ( item is HomeTableVC ){
                controller = item as! HomeTableVC;
                break outerloop;
            }
            
        }
        if(controller != nil){
            
            view.navigationController?.popToViewController(controller, animated: true);
            let controller = controller as! HomeTableVC;
            
            if(index == 0 || index == 1){
                controller.loadNewInvFromBasicData(index: index, inv: inv);
            }else{
                PageRedirect.redirectToSingleInv(view: controller, inv: inv);
            }
            
            
        }else{
            view.navigationController?.popViewController(animated: true);
        }
        
    }
    
    
    
    class func reverttoSplashPage(view: UIViewController){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        
        view.navigationController?.present(destination, animated: true, completion: {
            view.navigationController?.popViewController(animated: false);
        })
        
        
    }
    
    class func gotoCameraPreview(viewController: UIViewController, invListModel: [InvListModel], index: Int){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        let destination = storyboard.instantiateViewController(withIdentifier: "QRScannerController") as! QRScannerController
        destination.invListModel = invListModel;
        destination.selectIndex = index;
        viewController.navigationController?.pushViewController(destination, animated: true);
        
    }
    
    class func openSidemenu(viewController: UIViewController){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        let destination = storyboard.instantiateViewController(withIdentifier: "SideMenuVC2") as! SideMenuVC2
        
//        let transition = CATransition()
//        transition.duration = 0.25
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromLeft
//        viewController.view.layer.add(transition, forKey: kCATransition)
        
        viewController.presentDetail(destination);
        
    }
    
    
    
}
