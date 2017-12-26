//
//  InvPageVC.swift
//  cinventory
//
//  Created by Xtreme Hardware on 24/12/2017.
//  Copyright © 2017 pixel. All rights reserved.
//

import Foundation
import UIKit

class InvPageVC: UIPageViewController {
    //
    // IBOutlets
    
    // variables
    var invListModel: InvListModel!;
    
    override func viewDidLoad() {
        //
        dataSource = self;
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil);
        }
        
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("RowsExampleViewController"),
                self.newViewController("InvBasicVC"),
                self.newViewController("InvCostVC"),
                self.newViewController("InvOptionsVC"),
                self.newViewController("InvValuationVC"),
                self.newViewController("InvConditionVC"),
                self.newViewController("InvRepairVC"),
                self.newViewController("InvTitlesVC"),
                self.newViewController("InvPicturesVC"),
                self.newViewController("InvFilesVC")
            ]
    }()
    
    private func newViewController(_ controllerName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: controllerName) as UIViewController
        return destination;
    }
    
    func updateInvLocalData(invListModel: InvListModel){
        
        print("in InvPageVC");
        print(invListModel);
        self.invListModel = invListModel;
        
        if let vc = orderedViewControllers[0] as? InvBasicVC {
            vc.setData(invListModel: invListModel);
        }
        
        
    };
    
    
    
}

// MARK: UIPageViewControllerDataSource
extension InvPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    

    
}
