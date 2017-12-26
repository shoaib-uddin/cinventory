//
//  IconCVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit

class IconCVC: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: [String:Any]){
        var name = data["Name"] as! String;
        lblTitle.text = name;
        
    }
    
    func setSelectedState(){
        self.setBorder(color: "#9c9c9c", radius: 10, width: 1);
    }
    
    func setUnselectedState(){
        self.setBorder(color: "#00000", radius: 0, width: 0);
    }

}
