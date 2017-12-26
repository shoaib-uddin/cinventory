//
//  StyleHelper.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    func setCons(icon: String, showIcon: Bool){
        
        let v = self;
        // border and border color
        v.layer.cornerRadius = 15.0;
        v.layer.masksToBounds = true;
        v.layer.borderColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.5).cgColor;
        v.layer.borderWidth = 1.0;
        
        // height of text field
        v.frame.size.height = 70;
        
        if(showIcon){
            
            
            // add image and indent a little
            let imgLeft: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: v.frame.height-25, height: 40 ))
            // Set frame as per space required around icon
            imgLeft.image = UIImage(named: icon)
            imgLeft.contentMode = .center
            // Set content mode centre
            v.leftView = imgLeft;
            
            // add a right border on image
            let sublayer: CALayer = CALayer();
            sublayer.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.5).cgColor;
            
            sublayer.frame = CGRect(x: imgLeft.bounds.size.width, y: 0, width: 1, height: imgLeft.frame.size.height)
            imgLeft.layer.addSublayer(sublayer)
            v.leftViewMode = .always
            
            
            
        }else{
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: v.frame.height))
            v.leftView = paddingView
            v.leftViewMode = UITextFieldViewMode.always
            
            
            
            
            
        }
    }
    
}

extension UIButton{
    
    func setCons(){
        // border and border color
        let v = self;
        v.layer.cornerRadius = 10.0;
        v.layer.masksToBounds = true;
        v.layer.borderColor = UIColor.white.cgColor;
        v.layer.borderWidth = 1.0;
        
    }
    
}

extension UIView{
    
    func setBorder(color: String, radius: Int, width: Int){
        self.layoutIfNeeded();
        self.layer.cornerRadius = CGFloat(radius);
        self.clipsToBounds = true;
        self.layer.borderColor = colorWithHexString(color).cgColor;
        self.layer.borderWidth = CGFloat(width);
    }
    
}


