//
//  LeftMenuViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 29/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuViewController: UIViewController {
    
  //MARK: Properties
    
    var selectedIndex:Int = 0
    
  //MARK: View Life Cycle

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SidebarCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SideBarTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        // Fetches the appropriate player for the data source layout.
        let titles: [String] = ["Home", "Predictions", "Statistics", "My Team", "Settings", "Logout"]
        
        let images: [String] = ["Image1", "Image3", "Image6", "Image2", "Image5",""]
        
        cell.sidebarLabel.text = titles[indexPath.row]
        cell.sidebarImageView.image = UIImage(named: images[indexPath.row])
        
        if(indexPath.row == selectedIndex)
        {
           cell.selectionImageView.image = UIImage(named:"active-left" )
        }
        else
        {
           cell.selectionImageView.image = nil
        }

       
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
     // MARK: - Table view Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectedIndex = indexPath.row
        tableView .reloadData()
        
         switch indexPath.row {
         case 0:
 
//            let viewController = storyboard!.instantiateViewControllerWithIdentifier("NewsViewController") as! NewsViewController
//            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: viewController)
             sideMenuViewController?.hideMenuViewController()
             break
//         case 1:
//
//            let viewController = storyboard!.instantiateViewControllerWithIdentifier("ScorerViewController") as! ScorerViewController
//            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: viewController)
//            sideMenuViewController?.hideMenuViewController()
//            break

         case 4:
//            
           let viewController = storyboard!.instantiateViewControllerWithIdentifier("SettingVC") as! SettingVC
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: viewController)
            sideMenuViewController?.hideMenuViewController()

               
          default:
              break
          }
        
        
    }

}




    


    