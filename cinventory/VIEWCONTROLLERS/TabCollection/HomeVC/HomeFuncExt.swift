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
        
        // initialize top header buttons - sidemenu - select and ImageDropdown
        let btnRight = UIBarButtonItem.init(title: "Signout", style: .plain, target: self, action: #selector(self.Signout(_:)));
        
        let scanButtonImage = UIImage(named: "inventory-qrcode-navigation.png");
        let btnQrCode = UIBarButtonItem.init(image: scanButtonImage, style: .plain, target: self, action: #selector(self.scanInventoryByQrCode(_:)));
        btnQrCode.tintColor = UIColor.white;
        
        self.navigationItem.rightBarButtonItems = [ btnQrCode , btnRight ]
        
    }
    
    // call from right most header button
    @objc func Signout(_ sender: UIBarButtonItem){
        // open selection of multiphoto select
        
        UserModel.setLoggedOutUser();
        PageRedirect.redirectToLogin(view: self);
        
        
    }
    
    // call from right most header button
    @objc func scanInventoryByQrCode(_ sender: UIBarButtonItem){
        // open selection of multiphoto select
        if(self.invListModel.count == 0){
            UtilityHelper.AlertMessage("Please wait or load inventory list first");
        }else{
            PageRedirect.gotoCameraPreview(viewController: self, invListModel: self.invListModel);
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
            self.activityIndicator.isHidden = true;
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
    
}
