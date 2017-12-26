//
//  ValidationHelper.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
class Validate
{
    
    class func Required(_ text:String, Label:String) -> Bool
    {
        
        if(text.characters.count == 0 ){
            UtilityHelper.AlertMessage("Please Enter " + Label);
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    class func NoWhiteSpace(text:String, Label:String) -> Bool
    {
        
        if(text.contains(" ")){
            UtilityHelper.AlertMessage("No white spaces allowed");
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    class func lettersNumbersOnly(text:String, Label:String) -> Bool
    {
        
        let characterSet = NSMutableCharacterSet() //create an empty mutable set
        characterSet.formUnion(with: NSCharacterSet.alphanumerics)
        characterSet.addCharacters(in: " ")
        
        
        
        if(text.range(of: String(describing: characterSet.inverted)) != nil){
            UtilityHelper.AlertMessage("special characters not allowed");
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    
    
    
    class func alphanumeric(text:String, Label:String) -> Bool
    {
        
        let characterSet = NSMutableCharacterSet() //create an empty mutable set
        characterSet.formUnion(with: NSCharacterSet.alphanumerics)
        characterSet.addCharacters(in: "!@#$%^&*")
        
        
        if(text.range(of: String(describing: characterSet.inverted)) != nil){
            UtilityHelper.AlertMessage("only lettern, numbers and !@#$%^&* allowed");
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    class func Length(text:String,length: Int, Label:String) -> Bool
    {
        
        if(text.characters.count < length ){
            UtilityHelper.AlertMessage(Label + " should be greater than or  equal to " + String(length) + " Charactors");
            return false;
        }
        else
        {
            return true;
        }
        
    }
    class func MaxLength(text:String,length: Int, Label:String) -> Bool
    {
        
        if(text.characters.count > length ){
            UtilityHelper.AlertMessage(Label + " should be less than " + String(length) + " Charactors");
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    
    class func MatchStrings(Text1: String, Text2 :String, Label1 : String, Label2 : String) -> Bool{
        if(Text1 != Text2 ){
            UtilityHelper.AlertMessage(Label1 + " and " + Label2 + " should be same");
            return false;
        }
        else
        {
            return true;
        }
    }
    
    class func Max() -> Bool
    {
        return true;
    }
    
    class func Min() -> Bool
    {
        return true;
    }
    
    class func isInteger(text:String, Label:String) -> Bool
    {
        let num = Int(text);
        if( num != nil){
            return true;
        }
        else{
            UtilityHelper.AlertMessage("Please Enter only Number in " + Label);
            return false;
            
        }
    }
    
    class func Email(text:String, Label:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(!emailTest.evaluate(with: text)){
            UtilityHelper.AlertMessage("Please Enter Valid " + Label);
            return false;
        }
        else{
            return true;
        }
        
    }
    
    
    
    
    
    
}
