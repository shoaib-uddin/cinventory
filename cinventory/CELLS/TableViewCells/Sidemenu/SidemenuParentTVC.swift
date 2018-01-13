//
//  SidemenuParentTVC.swift
//  PolaroidPopLayouts
//
//  Created by clines227 on 14/06/2017.
//  Copyright © 2017 matech. All rights reserved.
//

import UIKit

class SidemenuParentTVC: UITableViewCell {

    
    @IBOutlet weak var stripView: UIView!
    @IBOutlet weak var menuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: [String:Any]){
        
        print(data);
        stripView.setBackgroundColor(color: data["StripColor"] as! String)
        let lbl = LangTrans(str: (data["Label"] as! String?)!);
        menuLabel.text = lbl.uppercased();
        
    }
    
}
