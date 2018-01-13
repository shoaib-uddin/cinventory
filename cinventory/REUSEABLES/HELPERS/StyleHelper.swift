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
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(newValue) {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set(newValue) {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    /// Create snapshot
    ///
    /// - parameter rect: The `CGRect` of the portion of the view to return. If `nil` (or omitted),
    ///                   return snapshot of the whole view.
    ///
    /// - returns: Returns `UIImage` of the specified portion of the view.
    
    func snapshot(of rect: CGRect? = nil) -> UIImage? {
        // snapshot entire view
        
        if(rect == nil){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: round(self.bounds.size.width), height: round(self.bounds.size.height)), false, 0.0)
            let contextx: CGContext? = UIGraphicsGetCurrentContext()
            self.layer.render(in: contextx!)
            let capturedScreen: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return capturedScreen!
        }else{
            
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0);
            
            
            //UIGraphicsBeginImageContext(self.frame.size)
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            let wholeImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // if no `rect` provided, return image of whole view
            
            guard let image = wholeImage, let rect = rect else { return wholeImage }
            
            // otherwise, grab specified `rect` of image
            
            let scale = image.scale
            let scaledRect = CGRect(x: rect.origin.x * scale, y: rect.origin.y * scale, width: rect.size.width * scale, height: rect.size.height * scale)
            guard let cgImage = image.cgImage?.cropping(to: scaledRect) else { return nil }
            return UIImage(cgImage: cgImage, scale: scale, orientation: .up)
            
        }
        
    }
    
    func setBackgroundColor(color: String){
        self.backgroundColor = colorWithHexString(color);
    }
    
    func halfTriangleView(){
        
        let v = self;
        v.layoutIfNeeded();
        let simpleLayer = CALayer()
        
        let ratio: CGFloat = 1.0
        let viewWidth = v.layer.frame.width
        let viewHeight = v.layer.frame.height
        let layerWidth = viewWidth * ratio
        let layerHeight = viewHeight * ratio
        
        let rect = CGRect(origin: CGPoint(x: viewWidth / 2 - layerWidth / 2,
                                          y: viewHeight / 2 - layerHeight / 2),
                          size: CGSize(width: layerWidth, height: layerHeight))
        
        let topRightPoint = CGPoint(x: rect.width, y: 0)
        let bottomRightPoint = CGPoint(x: rect.width, y: rect.height - 15)
        let topLeftPoint = CGPoint(x: 0, y: 0)
        
        let linePath = UIBezierPath()
        
        linePath.move(to: topLeftPoint)
        linePath.addLine(to: topRightPoint)
        linePath.addLine(to: bottomRightPoint)
        linePath.addLine(to: topLeftPoint)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = linePath.cgPath
        
        simpleLayer.frame = rect
        simpleLayer.backgroundColor = UIColor.white.cgColor
        simpleLayer.mask = maskLayer
        v.layer.addSublayer(simpleLayer)
        
    }
    
    func setBorder(color: String, radius: Int, width: Int){
        self.layoutIfNeeded();
        self.layer.cornerRadius = CGFloat(radius);
        self.clipsToBounds = true;
        self.layer.borderColor = colorWithHexString(color).cgColor;
        self.layer.borderWidth = CGFloat(width);
    }
    
    
    func rotateWithAngle(degree: Double ){
        
        self.layoutIfNeeded();
        self.layoutSubviews();
        
        let radians = CGFloat(degree * Double.pi / 180)
        self.transform = CGAffineTransform(rotationAngle:radians)
        
        
    }
    
    func insertDotIndicator(radius: Double, color : String){
        
        self.layoutIfNeeded();
        self.layoutSubviews();
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height);
        shapeLayer.fillColor = colorWithHexString(color).cgColor;
        
        let arcCenter = shapeLayer.position
        let radius = CGFloat(Int(radius));
        let startAngle = CGFloat(0.0);
        let endAngle = CGFloat(2.0 * .pi)
        let clockwise = true
        
        let circlePath = UIBezierPath(arcCenter: arcCenter,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: clockwise)
        
        shapeLayer.path = circlePath.cgPath
        self.layer.addSublayer(shapeLayer);
        
        
    }
    
    func verticalFirstRadiusLine(width: CGFloat, color : String){
        
        
        
        self.layoutIfNeeded();
        self.layoutSubviews();
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height);
        shapeLayer.fillColor = colorWithHexString(color).cgColor;
        shapeLayer.path = UIBezierPath(rect: CGRect(x: (shapeLayer.frame.width / 2.0) - (width / 2.0), y: 0, width: width, height: (shapeLayer.frame.height / 2.0))).cgPath
        self.layer.addSublayer(shapeLayer);
        
    }
    
    func verticalSecondRadiusLine(width: CGFloat, color : String){
        
        
        self.layoutIfNeeded();
        self.layoutSubviews();
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height);
        shapeLayer.fillColor = colorWithHexString(color).cgColor;
        shapeLayer.path = UIBezierPath(rect: CGRect(x: (shapeLayer.frame.width / 2.0) - (width / 2.0), y: (shapeLayer.frame.height / 2.0), width: width, height: (shapeLayer.frame.height / 2.0))).cgPath
        self.layer.addSublayer(shapeLayer);
        
    }
    
    
    
    
    
    
}

extension UIImageView{
    
    func roundWhiteImageBorder(){
        let v = self;
        v.layer.cornerRadius = v.frame.size.height/2;
        v.clipsToBounds = true;
        v.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        v.layer.borderWidth = 2;
        
    }
    
    func roundWhiteImageBorderWidthWise(){
        let v = self;
        v.layer.cornerRadius = v.frame.size.width/2;
        v.clipsToBounds = true;
        v.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        v.layer.borderWidth = 2;
        
    }
    
}

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
                let transition = CATransition()
                transition.duration = 0.25
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromLeft
                self.view.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: true);
    }
    
    func dismissDetail() {
                let transition = CATransition()
                transition.duration = 0.25
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromRight
                self.view.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false);
    }
}


