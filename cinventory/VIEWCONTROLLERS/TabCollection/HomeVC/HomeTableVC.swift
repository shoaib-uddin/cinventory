//
//  HomeTableVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit
import ActionSheetPicker_3_0

var GLobalHomeTableVC: HomeTableVC!;

class HomeTableVC: BaseViewController {
    //
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // variables
    var invListModel: [InvListModel] = [InvListModel]();
    var refreshControl: UIRefreshControl!
    let searchController = UISearchController(searchResultsController: nil)
    var filterdinvListModel: [InvListModel] = [InvListModel]();
    let screenSize : CGRect = UIScreen.main.bounds;
    let window: UIWindow! = UIApplication.shared.delegate!.window!
    
    
    
    
    override func viewDidLoad() {
        //
        GLobalHomeTableVC = self;
        
        // initialize header buttons
        initHeaderBarItems();
        
        // initialize tableView
        let nibname = "InvListTVC";
        let nib = UINib(nibName: nibname, bundle: nil);
        tableView.register(nib, forCellReuseIdentifier: nibname)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // table Styles
        tableView.estimatedRowHeight = 400;
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.backgroundView?.backgroundColor = UIColor.clear;
        tableView.backgroundColor = UIColor.clear
        
        // refresh table view via pull
        refreshControl = UIRefreshControl()
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged);
        refreshControl.tag = 102;
        tableView.addSubview(refreshControl) // not required when using UITableViewController
        
        // add a search to tableView
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        // load data on first load
        loadData();
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func actionAddInv(_ sender: UIButton) {
        
        if(self.invListModel.count == 0){
            UtilityHelper.AlertMessage("Please wait or load inventory list first");
            return;
        }else{
        
            ActionSheetStringPicker.show(withTitle: "Chose Inventory", rows: ["Add Now","Add Later"], initialSelection: 1, doneBlock: { (picker, index, value) in
                //
                //print(picker, index, value);
                self.openScanner(index);
                
            }, cancel: { (picker) in
                //
                
            }, origin: sender)
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
