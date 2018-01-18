//
//  InvCostTVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 16/01/2018.
//  Copyright © 2018 pixel. All rights reserved.
//

import UIKit

class InvCostTVC: UITableViewCell {

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
