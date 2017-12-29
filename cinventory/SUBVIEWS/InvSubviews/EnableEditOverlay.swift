//
//  EnableEditOverlay.swift
//  cinventory
//
//  Created by Xtreme Hardware on 29/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import UIKit

class EnableEditOverlay: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var btnEnableEditing: UIButton!
    
    override func awakeFromNib() {
        btnEnableEditing.setCons();
    }
    
    @IBAction func actionEnableEditing(_ sender: UIButton) {
        self.removeFromSuperview();
    }
    

}
