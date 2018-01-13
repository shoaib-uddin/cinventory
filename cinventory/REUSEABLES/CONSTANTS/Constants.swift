//
//  Constants.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit


// Global Parameters
var g_invListModel: InvListModel!;

// static structures
struct  DateFormatter {
    static let timeString = "hh:mm a"
    static let fullDate = "dd-MMM-yyyy HH:mm:ss.SSS";
    static let postDate = "yyyy-MM-dd HH:mm:ss";
    static let minuteSeconds = "HH:mm";
    static let WeekText = "EEEE";
    static let Date = "dd-MMM-yyyy";
}

struct settings
{
    static let timeOut :Double = 5.0;
    
    struct api {
        static let SERVICEURL = "http://inventoryapi2.pixtechcreation.com/api/InventoryApi/";
        
    }
}

func LangTrans(str : String) -> String{// Language Translate
    return NSLocalizedString(str, comment: "");
}
