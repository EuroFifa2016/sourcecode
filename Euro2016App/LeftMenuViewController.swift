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
    var titles:[String] = []
    var images: [String] = []
  //MARK: View Life Cycle

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userId = userDefaults .valueForKey("id") as? String ?? ""
        
        /// =================
        if (userId == "" )
        {
            titles = ["Home", "Predictions", "Statistics", "My Team", "Settings"]
            
            images = ["Image1", "Image3", "Image6", "Image2", "Image5"]
            
        }
        else
        {
            titles = ["Home", "Predictions", "Statistics", "My Team", "Settings", "Logout"]
            
            images = ["Image1", "Image3", "Image6", "Image2", "Image5",""]
            
        }

        
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
        
        return titles.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SidebarCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SideBarTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
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

         case 4: break
//          
/*
           let viewController = storyboard!.instantiateViewControllerWithIdentifier("SettingVC") as! SettingVC
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: viewController)
            sideMenuViewController?.hideMenuViewController()
*/
         case 5:
            
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults .removeObjectForKey("id")
             userDefaults .removeObjectForKey("playerId")
            userDefaults .removeObjectForKey("countryId")
            
            
            // let loginViewController = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
         
            
                self.navigationController?.popViewControllerAnimated(true)
                    let loginManager = FBSDKLoginManager()
                loginManager.logOut() // this is an instance function
            
             GIDSignIn.sharedInstance().signOut()
            
            
            
                print("LogOut")
             //}
           
          default:
              break
          }
        
        
    }

}




    


    