//
//  SideMenuViewController.swift
//  VKPolaroidIPCamera
//
//  Created by Aliakber on 06/11/2016.
//  Copyright © 2016 Sample. All rights reserved.
//

import UIKit


class SideMenuVC2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    
    // variables
    let cellIdentifier = "SidemenuParentTVC"
    var collectionArray: [[String:Any]] = [[ : ]];
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        profileImageView.roundWhiteImageBorder();
        lblProfileName.text = UserModel.GetInfo().FullName;
        
        
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 85.0;
        tableView.tableFooterView = UIView(frame: CGRect.zero);
        initCollectionItems()
    }
    
    
    @IBAction func closeMenu(_ sender: UIButton) {
        //self.dismissDetail();
        dismiss(animated: false);
        //self.view.superview?.superview?.superview?.superview?.superview?.removeFromSuperview();
    }
    
    fileprivate func initCollectionItems(){
        
        self.collectionArray = UtilityHelper.getPlistContent(name: "MenuItems");
        self.tableView.reloadData();
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //
        return 1
    }
    
    //    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    //
    //        if(indexPath.row == 1){
    //            return nil;
    //        }else{
    //            return indexPath;
    //        }
    //    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collectionArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuParentTVC", for: indexPath as IndexPath) as! SidemenuParentTVC;
        cell.setData(data: self.collectionArray[indexPath.row]);
        cell.selectionStyle = .none;
        
        //        if(indexPath.row == 1){
        //            cell.menuLabel.alpha = 0.4;
        //        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to next view controller
        DispatchQueue.main.async {
            
            let collection = self.collectionArray[indexPath.row];
            let key = collection["Key"] as! String;
            switch key {
            case "LOG":
                
                    self.dismissDetail();
                    PageRedirect.redirectToLogin(view: GLobalHomeTableVC);
                
                
                
                
                
            default:
                print("nothing happens yet");
            }
            
        }
        
        
    }
    
    
    
    
}



