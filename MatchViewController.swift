//
//  MatchViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 15/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class MatchViewController: ActivityIndicatorViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var matchTable: UITableView!
    
    //MARK: Properties
   // var match = [Match]()
    
    var parsedArray : NSMutableArray!
    
    var array1 : NSMutableArray = NSMutableArray()
    var array2 : NSMutableArray = NSMutableArray()
    var array3 : NSMutableArray = NSMutableArray()
    var array4 : NSMutableArray = NSMutableArray()
    var array5 : NSMutableArray = NSMutableArray()
  
    
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
                if response.objectForKey("result") as? Bool == true

              //  Navjot Code
                {
                
                   print(response)
                    self.parsedArray = response.objectForKey("matchesInfo") as! NSMutableArray
                    print(self.parsedArray.objectAtIndex(0))
                    for (var i = 0; i < self.parsedArray.count; i++)
                   
                    {
                        
                    if self.parsedArray.valueForKey("group_stage").objectAtIndex(i) as! String == "1"
                    {
                        
                        self.array1.addObject(self.parsedArray.objectAtIndex(i))
                        print(self.array1)

                    }
                  else  if self.parsedArray.valueForKey("round_of_16").objectAtIndex(i) as! String == "1"
                        {
                           self.array2.addObject(self.parsedArray.objectAtIndex(i))
                        }

                    else  if self.parsedArray.valueForKey("quater_final").objectAtIndex(i) as! String == "1"
                    {
                         self.array3.addObject(self.parsedArray.objectAtIndex(i))
                    }
                    else if  self.parsedArray.valueForKey("semifinal").objectAtIndex(i) as! String == "1"
                    {
                         self.array4.addObject(self.parsedArray.objectAtIndex(i))

                    }
                     else if self.parsedArray.valueForKey("final").objectAtIndex(i) as! String == "1"
                    {
                         self.array5.addObject(self.parsedArray.objectAtIndex(i))

                    }

                    
                
                }
                    self.matchTable.delegate = self
                    self.matchTable.dataSource = self
                    self.matchTable .reloadData()
                
                    
        }
        
        
        
        
        
        
        }
        
    }
        func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 25))
        header.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        
        
        let label = UILabel(frame: CGRectMake(10, 10, header.frame.size.width-50, 25))
        
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor .whiteColor()
        label.font = UIFont(name: "Quicksand-Regular", size: 14)
        switch (section)
        {
        case 0:
            
            label.text = "Group Stage Matches"

            
            
        case 1:
            label.text = "Round of 16"
            
            
        case 2:
           label.text = "Quarter finals"
            
        case 3:
            label.text = "Semi final"
            
        case 4:
            label.text = "Final Match"
            
        default :
            print("done")
        }
        
        
        header.addSubview(label)
        
        return header


    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
         return 5
            //self.array.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var Count :Int!
        switch (section)
        {
        case 0:
           
            Count = self.array1.count
            
            
        case 1:
            Count = self.array2.count
        
                
        case 2:
             Count = self.array3.count
       
        case 3:
        Count = self.array4.count
        
        case 4:
        Count = self.array5.count
        
        default :
            print("done")
        }
        
            return Count
                //self.array[section]["groupInfo"]!.count
       
       
    
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchTableViewCell", forIndexPath: indexPath) as! MatchTableViewCell
        
        switch (indexPath.section)
        {
        case 0:
        
            print(indexPath.row)
            cell.firstTeamLabel.text = self.array1[indexPath.row]["team1_name"] as? String
        
            //cell.firstTeamLabel.text = self.match[section].mat
            
            cell.secondTeamLabel.text = self.array1[indexPath.row]["team2_name"] as? String
            
            let team1goals = self.array1[indexPath.row]["team1_goals"] as? String
             let team2goals = self.array1[indexPath.row]["team2_goals"] as? String
                 //   cell.secondTeamLabel.text = self.match[section].matchDict["team2_name"]
            
            
            
            cell.pointsLabel.text =  team1goals! + "  :  " + team2goals!
            
            
            let imageUrl1 = NSURL(string: self.array1[indexPath.row]["team1_flag"] as! String  )
            
            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
            
            let imageUrl2 = NSURL(string: self.array1[indexPath.row]["team2_flag"] as! String  )
            
            
           cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
            
            if indexPath.row == 0
            {
                cell.timeLabel.hidden = false
                cell.timeLabel.text=self.array1[indexPath.row]["date"] as? String
                
            }
            else
            {
                cell.timeLabel.hidden = true
            }

        case 1:
            
             print(indexPath.row)
            cell.firstTeamLabel.text = self.array2[indexPath.row]["team1_name"] as? String
            
           
            
            
            cell.secondTeamLabel.text = self.array2[indexPath.row]["team2_name"] as? String
            
            let team1goals = self.array2[indexPath.row]["team1_goals"] as? String
            let team2goals = self.array2[indexPath.row]["team2_goals"] as? String
            
            
            
            cell.pointsLabel.text =  team1goals! + "  :  " + team2goals!
            
            let imageUrl1 = NSURL(string: self.array2[indexPath.row]["team1_flag"] as! String  )
            
            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
            
            let imageUrl2 = NSURL(string: self.array2[indexPath.row]["team2_flag"] as! String  )
            
            
            cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
            
             if indexPath.row == 0
             {
                cell.timeLabel.hidden = false
                cell.timeLabel.text=self.array2[indexPath.row]["date"] as? String
                
             }
             else
             {
                cell.timeLabel.hidden = true
            }
            

            
           
       case 2:
            cell.firstTeamLabel.text = self.array3[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array3[indexPath.row]["team2_name"] as? String
            
            cell.secondTeamLabel.text = self.array2[indexPath.row]["team2_name"] as? String
            
            let team1goals = self.array3[indexPath.row]["team1_goals"] as? String
            let team2goals = self.array3[indexPath.row]["team2_goals"] as? String
            
           cell.pointsLabel.text =  team1goals! + "  :  " + team2goals!
            let imageUrl1 = NSURL(string: self.array3[indexPath.row]["team1_flag"] as! String  )
            
            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
            
            let imageUrl2 = NSURL(string: self.array3[indexPath.row]["team2_flag"] as! String  )
            
            
            cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
            
            if indexPath.row == 0
            {
                cell.timeLabel.hidden = false
                cell.timeLabel.text=self.array3[indexPath.row]["date"] as? String
                
            }
            else
            {
                cell.timeLabel.hidden = true
            }

            

       case 3:
        
            cell.firstTeamLabel.text = self.array4[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array4[indexPath.row]["team2_name"] as? String
            
            let team1goals = self.array3[indexPath.row]["team1_goals"] as? String
            let team2goals = self.array3[indexPath.row]["team2_goals"] as? String
            
            cell.pointsLabel.text =  team1goals! + "  :  " + team2goals!
            
            let imageUrl1 = NSURL(string: self.array4[indexPath.row]["team1_flag"] as! String  )
            
            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
            
            let imageUrl2 = NSURL(string: self.array4[indexPath.row]["team2_flag"] as! String  )
            
            cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
            
            if indexPath.row == 0
            {
                cell.timeLabel.hidden = false
                cell.timeLabel.text=self.array4[indexPath.row]["date"] as? String
                
            }
            else
            {
                cell.timeLabel.hidden = true
            }
            


            
           

       case 4:
            cell.firstTeamLabel.text = self.array5[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array5[indexPath.row]["team2_name"] as? String
            
            let team1goals = self.array3[indexPath.row]["team1_goals"] as? String
            let team2goals = self.array3[indexPath.row]["team2_goals"] as? String
            
            cell.pointsLabel.text =  team1goals! + "  :  " + team2goals!
            
            let imageUrl1 = NSURL(string: self.array5[indexPath.row]["team1_flag"] as! String  )
            
            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
            
            let imageUrl2 = NSURL(string: self.array5[indexPath.row]["team2_flag"] as! String  )
            
            cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
            
            if indexPath.row == 0
            {
                cell.timeLabel.hidden = false
                cell.timeLabel.text=self.array5[indexPath.row]["date"] as? String
                
            }
            else
            {
                cell.timeLabel.hidden = true
            }

            
          
            
        default:
            print("Done")
        }

        
        
        
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
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
//
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
