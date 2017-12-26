//
//  InventoryVCViews.swift
//  cinventory
//
//  Created by Xtreme Hardware on 26/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit;

extension InventoryVC{
    
    func loadView(index: String){
        
        switch index {
        case "BAS":
            
            if(self.invBasicVC != nil){ return }
            
            self.invBasicVC = sb.instantiateViewController(withIdentifier: "InvBasicVC") as! InvBasicVC
            addControlerToView(controller: invBasicVC);
            
            
            break
        case "CST":
            
            if(self.invCostVC != nil){ return }
            invCostVC = sb.instantiateViewController(withIdentifier: "InvCostVC") as! InvCostVC
            addControlerToView(controller: invCostVC);
            
            break
        case "OPT":
            
            if(self.invOptionsVC != nil){ return }
            invOptionsVC = sb.instantiateViewController(withIdentifier: "InvOptionsVC") as! InvOptionsVC
            addControlerToView(controller: invOptionsVC);
            
            break
        case "VLU":
            
            if(self.invValuationVC != nil){ return }
            invValuationVC = sb.instantiateViewController(withIdentifier: "InvValuationVC") as! InvValuationVC
            addControlerToView(controller: invValuationVC);
            
            break
        case "CON":
            
            if(self.invConditionVC != nil){ return }
            invConditionVC = sb.instantiateViewController(withIdentifier: "InvConditionVC") as! InvConditionVC
            addControlerToView(controller: invConditionVC);
            
            break
        case "RPR":
            
            if(self.invRepairVC != nil){ return }
            invRepairVC = sb.instantiateViewController(withIdentifier: "InvRepairVC") as! InvRepairVC
            addControlerToView(controller: invRepairVC);
            
            break
        case "TIL":
            
            if(self.invTitlesVC != nil){ return }
            invTitlesVC = sb.instantiateViewController(withIdentifier: "InvTitlesVC") as! InvTitlesVC
            addControlerToView(controller: invTitlesVC);
            
            break
        case "PIC":
            
            if(self.invPicturesVC != nil){ return }
            invPicturesVC = sb.instantiateViewController(withIdentifier: "InvPicturesVC") as! InvPicturesVC
            addControlerToView(controller: invPicturesVC);
            
            break
        case "FIL":
            
            if(self.invFilesVC != nil){ return }
            invFilesVC = sb.instantiateViewController(withIdentifier: "InvFilesVC") as! InvFilesVC
            addControlerToView(controller: invFilesVC);
            
            break
        default:
            break
        }
        
    }
    
    func unloadView(index: String , rejectChanges : Bool  = false){
    
        switch index {
        case "BAS":
            
            if(self.invBasicVC == nil){ return }
            removeControlerToView(controller: invBasicVC)
            self.invBasicVC = nil;
            break
            
        case "CST":
            
            if(self.invCostVC == nil){ return }
            removeControlerToView(controller: invCostVC);
            self.invCostVC = nil;
            break
            
        case "OPT":
            
            if(self.invOptionsVC == nil){ return }
            removeControlerToView(controller: invOptionsVC)
            self.invOptionsVC = nil;
            break
            
        case "VLU":
            
            if(self.invValuationVC == nil){ return }
            removeControlerToView(controller: invValuationVC)
            self.invValuationVC = nil;
            break
            
        case "CON":
            
            if(self.invConditionVC == nil){ return }
            removeControlerToView(controller: invConditionVC)
            self.invConditionVC = nil;
            break
            
        case "RPR":
            
            if(self.invRepairVC == nil){ return }
            removeControlerToView(controller: invRepairVC)
            self.invRepairVC = nil;
            break
            
        case "TIL":
            
            if(self.invTitlesVC == nil){ return }
            removeControlerToView(controller: invTitlesVC)
            self.invTitlesVC = nil;
            break
            
        case "PIC":
            
            if(self.invPicturesVC == nil){ return }
            removeControlerToView(controller: invPicturesVC)
            self.invPicturesVC = nil;
            break
            
        case "FIL":
            
            if(self.invFilesVC == nil){ return }
            removeControlerToView(controller: invFilesVC)
            self.invFilesVC = nil;
            break
            
        default:
            break
        }
    
    }
    
    func addControlerToView(controller: UIViewController){
        addChildViewController(controller)
        controller.view.frame = CGRect(x: 0, y: 0, width: self.PartialViewCC.frame.width, height: self.PartialViewCC.frame.height)
        self.PartialViewCC.addSubview(controller.view);
        controller.didMove(toParentViewController: self)
    }
    
    func removeControlerToView(controller: UIViewController){
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
}
