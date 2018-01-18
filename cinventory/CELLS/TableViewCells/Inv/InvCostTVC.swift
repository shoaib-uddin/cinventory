//
//  InvCostTVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 16/01/2018.
//  Copyright © 2018 pixel. All rights reserved.
//

import UIKit

class InvCostTVC: UITableViewCell {

//    var id: NSNumber?
//    var InvDate: String? = ""
//    var ExpenseType: String? = ""
//    var Vendor: String? = ""
//    var VendorInvNo: String? = ""
//    var RefNo: String? = ""
//    var InvAmount: String? = ""
//    var OneTimePay: String? = ""
//    var PayAmount: String? = ""
//    var PayType: String? = ""
//    var PayDate: String? = ""
//    var PaidBy: String? = ""
//    var InvBalance: NSNumber = 0
//    var InvImage: String? = ""
//    var Note: String? = ""
//    var Actions: String? = ""
//    var Debit: NSNumber = 0
//    var Credit: NSNumber = 0
    
    @IBOutlet var lblDataArray: [UILabel]!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(index: Int){
        
        lblDataArray[0].text = "#\(index)";
        
        
        
    }
    
}
