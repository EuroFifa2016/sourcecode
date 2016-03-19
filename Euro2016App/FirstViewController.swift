//
//  FirstViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 04/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: RGPageViewController, RGPageViewControllerDataSource, RGPageViewControllerDelegate {
    
    
    //MARK: Properties
    override var pagerOrientation: UIPageViewControllerNavigationOrientation {
        get {
            
            
            return .Horizontal
        }
    }
    
    override var tabbarPosition: RGTabbarPosition {
        get {
            
            
            return .Top
        }
    }
    
    override var tabbarStyle: RGTabbarStyle {
        get {
            
            return .Blurred
        }
    }
    
    override var tabIndicatorColor: UIColor {
        get {
            return UIColor.whiteColor()
        }
    }
    
    override var barTintColor: UIColor? {
        get {
            
            
            return UIColor .blackColor()
        }
    }
    
    override var tabStyle: RGTabStyle {
        get {
            return .InactiveFaded
        }
    }
    
    override var tabbarWidth: CGFloat {
        get {
            return 140.0
        }
    }
    
    override var tabMargin: CGFloat {
        get {
            return 16.0
        }
    }
    
    
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      
      self.currentTabIndex = 0
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.currentTabIndex = 0
    }
    
    var topbarArray:NSArray = ["News","Matches","Standing","Scorers"]
    
    //MARK: View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_bg")!)
      

        datasource = self
        delegate = self
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func reloadPager(sender: UIBarButtonItem)
    {
        reloadData()
    }
    
    // MARK: - RGPageViewController Data Source
    func numberOfPagesForViewController(pageViewController: RGPageViewController) -> Int
    {
        return topbarArray.count
    }
    
    func tabViewForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIView
    {
        var tabView: UIView!
        tabView = UILabel()
        (tabView as! UILabel).font = UIFont(name: "Quicksand-Regular", size: 13)!
        (tabView as! UILabel).text = topbarArray[index] as? String
        (tabView as! UILabel).textColor = UIColor .whiteColor()
        (tabView as! UILabel).sizeToFit()
        
        
        return tabView
    }
    
    func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        if (topbarArray.count == 0) || (index >= topbarArray.count) {
            return nil
        }
                   // Create a new view controller and pass suitable data.
                   if index==3
                   {
                       let dataViewController = storyboard!.instantiateViewControllerWithIdentifier("ScorerViewController") as! ScorerViewController
                    dataViewController.title = "Scorer";
                       return dataViewController
                   }
                   else if index == 2
                   {
                       let dataViewController = storyboard!.instantiateViewControllerWithIdentifier("StandingViewController") as! StandingViewController
                       return dataViewController
                   }
                   else if index == 1
                   {
                    let dataViewController = storyboard!.instantiateViewControllerWithIdentifier("MatchViewController") as! MatchViewController
                    return dataViewController
                   }
                   else
                   {
                   let dataViewController = storyboard!.instantiateViewControllerWithIdentifier("NewsViewController") as! NewsViewController
                       return dataViewController
                   }
        
    }
    
    // MARK: - RGPageViewController Delegate
    // use this to set a custom height for the tabbar
    func heightForTabAtIndex(index: Int) -> CGFloat {
        return 164.0
    }
    
    // use this to set a custom width for a tab
    func widthForTabAtIndex(index: Int) -> CGFloat
    {
       
            var tabSize = (topbarArray[index] as! String).sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(17)])
            
            tabSize.width += 8
            
            return tabSize.width
       
    }
    
    // use this to change the height of the tab indicator
    func widthOrHeightForIndicator() -> CGFloat {
        
        
        return 2.0
    }
}