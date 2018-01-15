//
//  NetworkHelper.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class NetworkHelper {
    
    class func maximumValue<T: Comparable>(first: T, second: T) -> T
    {
        if (first >= second)
        {
            return first
        }
        
        return second
    }
    
    class func MakePostRequest(
        _ Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : AnyObject?) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequest(HTTPMethod.post, Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    class func MakeGetRequest(
        _ Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : AnyObject?) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequest(HTTPMethod.get, Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    
    
    class func MakePutRequest(
        Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : AnyObject?) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequest(HTTPMethod.put, Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    class func MakeRequest(
        _ method: HTTPMethod,
        Url: String,
        postData: AnyObject? = nil ,
        params:Parameters? = [:],
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : AnyObject?) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil,
        retry:Bool = false
        ){
        
        
        //let req = UtilityHelper.CreateRequest("POST", Url: Url);
        if(showLoader){
            UtilityHelper.ShowLoader();
        }
        
        
        //Alamofire.request(req as! URLRequestConvertible)
        let Url = settings.api.SERVICEURL + Url;
        
        print(Url);
        Alamofire.request(Url, method: method).responseJSON { (response) in
            //
            switch response.result {
            case .success(let JSON):
                
                print(JSON);
                // let res =  response.response!;
                let resObj = ResponseObject(dictionary: JSON as! NSDictionary)
                print(resObj);
                
//                let ResponseString = resObj.toJsonString();
//
//                print("RESPONSE DATA : " + ResponseString);
                
                if(resObj.Status == 1){
                    
                    //print(resObj.Data);
                    
                    let data = (JSON as! NSDictionary).object(forKey: "Data") as! NSArray;
                    print(data)
                    
                    success?(data.ToString() as AnyObject);
                    if(showLoader){
                        UtilityHelper.HideLoader();
                    }
//                    let jsonDict : NSDictionary =   (JSON as AnyObject).ToDictionary()! as NSDictionary;
//                    let data = jsonDict.object(forKey: "Data") as! NSArray;
//
//                    success?(data.ToString() as AnyObject);
//                    if(showLoader){
//                        UtilityHelper.HideLoader();
//                    }
                    
                }
                else if(resObj.Status == 0){
                    
                    UtilityHelper.HideLoader();
                    UserModel.setExpireUser();
                    failure?(JSON as AnyObject);
                    
                }else{
                    
                    if(showLoader){
                        UtilityHelper.HideLoader();
                        UtilityHelper.AlertMessage(resObj.Message);
                    }
                    
                    failure?(JSON as AnyObject);
                    
                }
                
                
            case .failure(let error):
                
                print("RESPONSE DATA : ERROR: " + error.localizedDescription)
                if(showLoader){
                    UtilityHelper.HideLoader();
                }
                failure?(error as AnyObject);
                
            }
        }
        
    }
    
    
    
    
    class func MakePostRequestForArray(
        Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : String) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequestForArray("POST", Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    class func MakeGetRequestForArray(
        Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : String) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequestForArray("GET", Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    
    class func MakePutRequestForArray(
        Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : String) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil){
        
        MakeRequestForArray("PUT", Url: Url, postData: postData, showLoader: showLoader, timeOut: timeOut, success: success, failure: failure, headers: headers)
        
    }
    
    class func MakeRequestForArray(
        _ method: String,
        Url: String,
        postData: AnyObject? = nil ,
        showLoader : Bool = true,
        timeOut : Double = 0,
        success: ((_ successData : String) -> Void)!,
        failure: ((_ error : AnyObject?) -> Void)!,
        headers : [String: String]? = nil,
        retry:Bool = false)
    {
        
        var timeOut = timeOut
        var targetUrl:String =  Url;
        
        if(timeOut == 0){
            timeOut  = settings.timeOut;
        }
        
        if(!Url.lowercased().contains("http")){
            
            targetUrl =  settings.api.SERVICEURL + Url;
            
        }
        if(showLoader){
            UtilityHelper.ShowLoader();
        }
        var AllHeaders : [String: String] = [String: String]();
        
        if(headers != nil){
            AllHeaders = headers!;
        }
        
        if(!UtilityHelper.excludeAuthorization(targetUrl)){
            
            let model =  UserModel.GetInfo();
            if(model != nil){
//                AllHeaders["Authorization"] = model?.MembershipId;
            }
//            AllHeaders["api_key"] = credentials.api_key;
//            AllHeaders["api_secret_key"] = credentials.api_secret_key;
            
            
        }
        
        
        let URL = NSURL(string: targetUrl)!
        let req = NSMutableURLRequest.init(url: URL as URL);
        req.httpMethod = method;
//        req.addValue(UtilityHelper.generateDeviceToken(), forHTTPHeaderField: "Authorization")
        req.allHTTPHeaderFields = AllHeaders;
        if(postData != nil){
            req.httpBody = try! JSONSerialization.data(withJSONObject: !, options: [])
            let PostString = String(describing: postData!)
            
        }
        req.timeoutInterval = timeOut
        for header in AllHeaders {
            print("REQUEST HEADER : " + header.0 + ":" +   header.1)
        }
        
        
        print("REQUEST TIMEOUT TIME : \(timeOut)")
        
        Alamofire.request(req as! URLRequestConvertible)
            .responseString { response in
                switch response.result {
                case .success(let JSON):
                    
                    print("RESPONSE DATA : SUCCESS: " + JSON)
                    
                    let resObj = ResponseObject(json: JSON)
                    
                    if(resObj.Status == 1 ){
                        
                        let jsonDict : NSDictionary =   JSON.ToDictionary()! as NSDictionary;
                        let data = jsonDict.object(forKey: "Data") as! NSArray;
                        
                        success?(data.ToString());
                        if(showLoader){
                            UtilityHelper.HideLoader();
                        }
                        
                    }
                    else if(resObj.Status == 0){
                        
                        UtilityHelper.HideLoader();
                        UserModel.setExpireUser();
                        failure?(JSON as AnyObject);
                        
                    }else{
                        
                        if(showLoader){
                            UtilityHelper.HideLoader();
                            UtilityHelper.AlertMessage(resObj.Message);
                        }
                        
                        failure?(JSON as AnyObject);
                        
                    }
                    
                case .failure(let error):
                    
                    print("RESPONSE DATA : ERROR: " + error.localizedDescription)
                    if(showLoader){
                        UtilityHelper.HideLoader();
                    }
                    failure?(error as AnyObject);
                    
                }
                
                
        }
        
    }
    
    
    
}
