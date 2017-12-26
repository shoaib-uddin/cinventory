//
//  InventoryVCCV.swift
//  cinventory
//
//  Created by Xtreme Hardware on 26/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit;


extension InventoryVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //
        collectionView.layoutIfNeeded();
        //let width = (collectionView.frame.width/3) - 6;
        let height = collectionView.frame.height;
        return CGSize(width: (height * 1.5), height: height - 4 - (height * 0.10) );
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Dequeue a GridViewCell.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: IconCVC.self), for: indexPath) as? IconCVC
            else { fatalError("unexpected cell in collection view") }
        cell.setData(data: self.collectionArray[indexPath.row]);
        
        
        cell.setUnselectedState();
        if(self.selectedCellIndex == indexPath){
            cell.setSelectedState();
        }
        
        return cell;
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return self.collectionArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //
        return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
        // celldelegate?.redirectToContacts(self);
        selectCellManually(indexPath: indexPath);
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //
        deselectCellManually(indexPath: indexPath ,rejectChanges :false);
        
        
    }
    
    func selectCellManually(indexPath: IndexPath){
        
        for i in 0...(self.collectionArray.count - 1) {
            let index = IndexPath(row: i, section: 0);
            if let cell = collectionView.cellForItem(at: index) as? IconCVC{
                cell.setUnselectedState()
            } else { print("No cell appeared yet") }
            
            
        }
        
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true;
        self.selectedCellIndex = indexPath;
        
        var collection = self.collectionArray[indexPath.row];
        let cell = collectionView.cellForItem(at: indexPath) as! IconCVC;
        cell.setSelectedState();
        
        self.collectionArray[indexPath.row]["selected"] = true;
        
        let key = collection["KeyIndex"] as! String;
        loadView(index: collection["KeyIndex"] as! String)
    }
    
    func deselectCellManually(indexPath: IndexPath,rejectChanges : Bool){
        
        //self.selectedCellIndex = nil;
        
        if let cell = collectionView.cellForItem(at: indexPath) as? IconCVC{
            cell.setUnselectedState();
        } else { print("No cell appeared yet") }
        
        //cell?.setBorder(color: "#00000", radius: 0, width: 0);
        var collection = self.collectionArray[indexPath.row];
        
        
        self.collectionArray[indexPath.row]["selected"] = false;
        
        
        let key = collection["KeyIndex"] as! String;
        unloadView(index: collection["KeyIndex"] as! String , rejectChanges: rejectChanges)
    }
    
    
}
