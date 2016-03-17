//
//  StandingViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 12/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class StandingViewController: ActivityIndicatorViewController,UITableViewDataSource  {

   //MARK: Properties
     var standingArray = [Standing] ()
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_bg")!)
        let nib = UINib(nibName: "StandingTableSectionHeader", bundle: nil)
        self.tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "StandingTableSectionHeader")
        self.loadStandings()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadStandings(){
 
        super.progressBarDisplayer(true, view: self.view)
        DataManager.GETAPI("getGroupStandings") { (response) -> Void in
            super.progressBarDisplayer( false, view: self.view)
            if response.objectForKey("result") as? Bool == true {
                
                print(response)
                
                for index in response.objectForKey("getGroupStandings") as! NSArray
                {
                    
                    let groupName = (index.objectForKey("group_name")) as! String
                    print(groupName)
                    let dictArray = (index.objectForKey("team_info")) as! [[String:String]]
                     print(dictArray)
                    let standing = Standing(group: groupName, myNewDictArray: dictArray)
                    self.standingArray += [standing]
                 }

                print(self.standingArray)
               
                
            }
            
            self.tableView .reloadData()
        }
        
        
        
        
        }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return standingArray.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return standingArray[section].myNewDictArray.count
        
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StandingCell", forIndexPath: indexPath) as! StandingCell
        
  
        
        cell.rankLabel.text = standingArray[indexPath.section].myNewDictArray[indexPath.row]["team_rank"]
        
        cell.countryName.text = standingArray[indexPath.section].myNewDictArray[indexPath.row]["team_name"]
        
        let imageUrl = NSURL(string: standingArray[indexPath.section].myNewDictArray[indexPath.row]["team_flag"]! )
        
         cell.countryImageView.sd_setImageWithURL(imageUrl)
         cell.matchPlayedLabel.text = standingArray[indexPath.section].myNewDictArray[indexPath.row]["played"]
        
         cell.plusMinusLabel.text = standingArray[indexPath.section].myNewDictArray[indexPath.row]["goal_difference"]
        
         cell.pointsLabel.text = standingArray[indexPath.section].myNewDictArray[indexPath.row]["team_point"]
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
       
        let title = standingArray[section].group
        print(title)
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("StandingTableSectionHeader")
        let header = cell as! StandingTableSectionHeader
       
        header.groupLabel.text = title as String
        
        return cell
    }
   
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 20))
        footerView.backgroundColor = UIColor.clearColor()
        
        return footerView
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
