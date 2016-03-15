//
//  MatchViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 15/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class MatchViewController: ActivityIndicatorViewController {
    
    
    @IBOutlet weak var matchTable: UITableView!
   
    

    //MARK: Properties
    var match = [Match]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_bg")!)
        
        
        

        
        
        self.loadMatches()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMatches()
    {
        
        
        
        
            super.progressBarDisplayer(true, view: self.view)
            DataManager.GETAPI("getMatches")
                {
                    (response) -> Void in
                    super.progressBarDisplayer( false, view: self.view)
                    if response.objectForKey("result") as? Bool == true {
                       
                        
                        for index in response.objectForKey("matchesInfo") as! NSArray
                        {
 
                            if index.objectForKey("group_stage")as! String == "1"
                           {
                           
                            self.match += [ Match(matchgroup: "group_stage", matchDict: index as! [String:String] )]
                            
                           }
                            
                            
                            
                        }
                         print(self.match)
                        self.matchTable .reloadData()
                        
                    }
                    
                    
            }
        
        
            
        
       
        
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return self.match.count
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.match[section].matchDict.count
        
        
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        let height=(match[indexPath.section].matchDictArray[indexPath.row]["isFirst"])!as NSString
//        if height=="1"
//        {
//            return 64
//        } else {
//            return 44
//        }
//
//    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchTableViewCell", forIndexPath: indexPath) as! MatchTableViewCell
        
       
        
        
        
            cell.firstTeamLabel.text = self.match[section].mat
            
            
                    cell.secondTeamLabel.text = self.match[section].matchDict["team2_name"]
            
//                    cell.pointsLabel.text =  arrayDict[indexPath.section]["group_stage"]![indexPath.row]["team2_name"]
//            
//                    cell.firstTeamImageView.image = UIImage(imageLiteral:match[indexPath.section].matchDictArray[indexPath.row]["team1Image"]! )
//            
//                    cell.secondTeamImageView.image = UIImage(imageLiteral:match[indexPath.section].matchDictArray[indexPath.row]["team2Image"]! )
            
            
//                    if height=="1"
//                    {
//                        cell.timeLabel.text=match[indexPath.section].matchDictArray[indexPath.row]["DayandDate"]
//                    } else {
//                      cell.timeLabel.hidden = true
        
           
                  
            

            
        
        

        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
        
        let header = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 25))
        header.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        
        
        let label = UILabel(frame: CGRectMake(0, 0, header.frame.size.width-50, 25))
       
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor .whiteColor()
        label.font = UIFont(name: "Quicksand-Regular", size: 14)
        label.text = match[section].matchgroup as String
        header.addSubview(label)
        
        return header
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 20))
        footerView.backgroundColor = UIColor.clearColor()
        
        
        return footerView
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
