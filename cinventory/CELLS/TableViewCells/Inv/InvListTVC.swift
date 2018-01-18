//
//  InvListTVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit

class InvListTVC: UITableViewCell {

    @IBOutlet var lblDataArray: [UILabel]!;
    
    
    
//    PurchasePrice = 0;
//    actualLocation = "IN-TRANSIT";
//    id = 793;
//    make = Volvo;
//    milesIn = 110177;
//    model = XC90;
//    purchaseDate = "<null>";
//    stockNo = 4838801003;
//    vechicleAge = 0;
//    vin = YV4CZ982281483880;
//    year = 2008;
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(inv: InvListModel){
        
        lblDataArray[0].text = "ID - \(inv.id!)";
        lblDataArray[1].text = "\(inv.actualLocation!)";
        lblDataArray[2].text = "Stock # \(inv.stockNo!)";
        lblDataArray[3].text = "Model # \(inv.model!)";
        
        lblDataArray[4].text = "Age: \(inv.vechicleAge ?? 0)";
        
        
        lblDataArray[5].text = "Year: \(inv.year!)";
        lblDataArray[6].text = "VIN: \(inv.vin!)";
        
        
        
    }
    
}
