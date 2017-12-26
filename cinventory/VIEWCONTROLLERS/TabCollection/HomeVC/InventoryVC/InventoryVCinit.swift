//
//  InventoryVCinit.swift
//  cinventory
//
//  Created by Xtreme Hardware on 26/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

extension InventoryVC{

    func initCollectionItems(){
        
        self.collectionArray = UtilityHelper.getPlistContent(name: "invItems");
        for i in 0...(self.collectionArray.count - 1){
            self.collectionArray[i]["selected"] = false;
        }
        self.collectionView.reloadData();
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
            //
            self.selectCellManually(indexPath: self.selectedCellIndex);
        }
        
        
    }
    
    

}
