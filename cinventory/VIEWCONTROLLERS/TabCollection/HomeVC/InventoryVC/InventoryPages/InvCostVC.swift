//
//  InvCostVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class InvCostVC: UIViewController {
    //
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblProjectedPrice: UILabel!
    
    // variables
    
    
    override func viewDidLoad() {
        //
        lblOriginalPrice.text = "Actual Cost: 12358.28";
        lblProjectedPrice.text = "Projected Cost: 784.28";
        
        let nibname = "InvCostTVC";
        let nib = UINib(nibName: nibname, bundle: nil);
        tableView.register(nib, forCellReuseIdentifier: nibname)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // table Styles
        tableView.estimatedRowHeight = 400;
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.backgroundView?.backgroundColor = UIColor.clear;
        tableView.backgroundColor = UIColor.clear
        
    }
    
    
    
}

extension InvCostVC : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvCostTVC", for: indexPath) as! InvCostTVC
        cell.setData(index: indexPath.row);
        return cell
    }
}

