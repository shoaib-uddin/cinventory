//
//  HomeFuncExt.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

extension HomeTableVC : UISearchResultsUpdating{
    
    
    // All those functions that are initialized on page load and no need for user interaction stays here
    func initHeaderBarItems(){
        
        self.title = "Inventory";
        
        let scanButtonImage = UIImage(named: "inventory-qrcode-navigation.png");
        let btnQrCode = UIBarButtonItem.init(image: scanButtonImage, style: .plain, target: self, action: #selector(self.scanInventoryByQrCode(_:)));
        btnQrCode.tintColor = UIColor.white;
        
        self.navigationItem.rightBarButtonItems = [ btnQrCode ]
        
        let btnSidemenuImage = UIImage(named: "menu_btn.png");
        let btnSidemenu = UIBarButtonItem.init(image: btnSidemenuImage, style: .plain, target: self, action: #selector(self.ShowMenu(_:)));
        btnSidemenu.tintColor = UIColor.white;
        
        self.navigationItem.leftBarButtonItems = [ btnSidemenu ];
        
    }
    
    // call from first most header button
    @objc func ShowMenu(_ sender: UIBarButtonItem){
        
        PageRedirect.openSidemenu(viewController: self);
        
        
    }
    
    // call from right most header button
    @objc func scanInventoryByQrCode(_ sender: UIBarButtonItem){
        // open selection of multiphoto select
        self.openScanner(3);
        
    }
    
    func openScanner(_ int: Int){
        if(self.invListModel.count == 0){
            UtilityHelper.AlertMessage("Please wait or load inventory list first");
        }else{
            PageRedirect.gotoCameraPreview(viewController: self, invListModel: self.invListModel, index: int);
        }
    }
    
    // delegate function fo rsearch
    func updateSearchResults(for searchController: UISearchController) {
        //
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            filterdinvListModel = invListModel.filter({ (list) -> Bool in
                
                // filter by actual location || model || stock No
                let flag = ( (list.actualLocation?.lowercased().contains(searchText.lowercased()))! ||
                             (list.model?.lowercased().contains(searchText.lowercased()))! ||
                             (list.stockNo?.lowercased().contains(searchText.lowercased()))! ||
                             (list.vin?.lowercased().contains(searchText.lowercased()))! 
                           )
                
                return flag
            })
            
        } else {
            filterdinvListModel = invListModel
        }
        tableView.reloadData()
    }
    
    @objc func refresh() {
        // Code to refresh table view
        loadData();
    }
    
    func loadData(){
        
        self.invListModel.removeAll();
        self.tableView.reloadData();
        
        self.refreshControl.beginRefreshing();
        let memberId = UserModel.GetInfo().MembershipId!;
        Inventory.getInvList(memberId) { (success, data) in
            //
            if(success){
                self.invListModel = data!;
                // swap filter variable
                self.filterdinvListModel = self.invListModel;
                self.tableView.reloadData();
                
                if(self.refreshControl != nil){
                    self.refreshControl.endRefreshing();
                    //refreshControl.removeFromSuperview();
                }
                
                
            }else{
                UtilityHelper.AlertMessage("Something Went wrong, Please refresh");
            }
        }
    }
    
    
    func loadNewInvFromBasicData(index: Int, inv: InvListModel){
        
        
        Inventory.getVinInfoData(UserModel.GetInfo().MembershipId!, vin: inv.vin!) { (success, basicData) in
            
            if(!success){
                UtilityHelper.AlertMessage("VIN Data fetch Erorr");
                return;
            }else{
                
                let new_inv = InvListModel();
                if let data = (basicData as! [EnInventoryBasicTab]).first{
                    new_inv.id = data.Id;
                    new_inv.vin = data.Vin;
                    new_inv.make = data.Make;
                    new_inv.model = data.Model;
                    new_inv.year = data.Year;
                    new_inv.actualLocation = data.ActualLocation;
                    new_inv.milesIn = data.MilesIn;
                    
                    PageRedirect.redirectToSingleInvWithBasicData(view: self, inv: new_inv, basicData: data);
                }else{
                    UtilityHelper.AlertMessage("Nothing Found");
                };
                
                
            
            }
            
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
