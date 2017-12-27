//
//  InventoryVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 23/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class InventoryVC: BaseViewController {
    //
    // IBOutlets
    @IBOutlet weak var InvSingleView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var PartialViewCC: UIView!
    @IBOutlet weak var PartialScrollViewCC: UIScrollView!
    // variables
    var invListTVC: InvListTVC!;
    var invListModel: InvListModel!;
    var invPageVC: InvPageVC!;
    var rowsExampleViewController: RowsExampleViewController!;
    var collectionArray: [[String:Any]] = [[ : ]];
    var selectedCellIndex: IndexPath! = IndexPath(row: 0, section: 0);
    var enInventoryBasicTab: EnInventoryBasicTab!;
    var loggedInModel: LoggedInModel = UserModel.GetInfo();
    
    
    // view controllers variables
    var invBasicVC: InvBasicVC!;
    var invCostVC:  InvCostVC!;
    var invOptionsVC: InvOptionsVC!;
    var invValuationVC: InvValuationVC!;
    var invConditionVC: InvConditionVC!;
    var invRepairVC: InvRepairVC!;
    var invTitlesVC: InvTitlesVC!;
    var invPicturesVC: InvPicturesVC!;
    var invFilesVC: InvFilesVC!;
    var sb = UIStoryboard(name: "Main", bundle: Bundle.main);
    
    override func viewDidLoad() {
        //
        // load top inventory view
        initTopView();
        
        collectionView.register(UINib(nibName: "IconCVC", bundle: nil), forCellWithReuseIdentifier: "IconCVC");
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.allowsMultipleSelection = false;
        initCollectionItems();
        
        
    }
    
    func initTopView(){
        
        if let invView = Bundle.main.loadNibNamed("InvListTVC", owner: self, options: nil)?.first as? InvListTVC{
            invView.setData(inv: invListModel);
            invView.frame = CGRect(x: 0, y: 0, width: InvSingleView.frame.width, height: InvSingleView.frame.height);
            self.InvSingleView.addSubview(invView);
        }
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
