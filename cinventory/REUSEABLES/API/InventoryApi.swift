//
//  InventoryApi.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class Inventory{
    //
    
    class func Login(_ UserName: String, _ Password: String, completion: @escaping (_ callback: Bool) -> Void){
        
        // Post Model Create
        let post = "username=\(UserName)&password=\(Password)";
        
        //Network Request
        NetworkHelper.MakePostRequest("Login?\(post)", postData: nil, showLoader: true, success: { (successData) -> Void in
            
            
            let response : [LoggedInModel] = [LoggedInModel](json: successData as? String);
            print(response);
            
            if(response[0].MembershipId != nil){
                UserModel.setLoginUser(response[0]);
                completion(true);
            }else{
                completion(false);
            }
            

        },failure: { (error) -> Void in
            print(error?.localizedDescription ?? "ERROR");
            completion(false);
            
        })
        
        
    }
    
    class func getInvList(_ membershipId: String, completion: @escaping (_ callback: Bool, _ data: [InvListModel]?) -> Void){
        
        // Post Model Create
        let post = "membershipId=\(membershipId)";
        var response : [InvListModel] = [InvListModel]();
        //Network Request
        NetworkHelper.MakeGetRequest("GetInventory2?\(post)", postData: nil, showLoader: true, success: { (successData) -> Void in
            
                response.removeAll();
                response = [InvListModel](json: successData as? String);
                completion(true, response);
            
            
        },failure: { (error) -> Void in
            print(error?.localizedDescription ?? "ERROR");
            completion(false, response);
            
        })
        
        
    }
    
    class func getInvBasicTabData(_ membershipId: String, invId: Int, completion: @escaping (_ callback: Bool, _ data: [EnInventoryBasicTab]?) -> Void){
        
        // Post Model Create
        let post = "membershipId=\(membershipId)&invId=\(invId)";
        var response : [EnInventoryBasicTab] = [EnInventoryBasicTab]();
        //Network Request
        NetworkHelper.MakePostRequest("InventoryBasicTab?\(post)", postData: nil, showLoader: true, success: { (successData) -> Void in
            
            response.removeAll();
            response = [EnInventoryBasicTab](json: successData as? String);
            completion(true, response);
            
            
        },failure: { (error) -> Void in
            print(error?.localizedDescription ?? "ERROR");
            completion(false, response);
            
        })
        
        
    }
    
    class func getVinInfoData(_ membershipId: String, vin: String, completion: @escaping (_ callback: Bool, _ data: [EnInventoryBasicTab]?) -> Void){
        
        // Post Model Create
        let post = "membershipId=\(membershipId)&vin=\(vin)";
        var response : [EnInventoryBasicTab] = [EnInventoryBasicTab]();
        //Network Request
        NetworkHelper.MakePostRequest("DecodeVin?\(post)", postData: nil, showLoader: true, success: { (successData) -> Void in
            
            response.removeAll();
            response = [EnInventoryBasicTab](json: successData as? String);
            completion(true, response);
            
            
        },failure: { (error) -> Void in
            print(error?.localizedDescription ?? "ERROR");
            completion(false, response);
            
        })
        
        
    }
    
    
    
}
