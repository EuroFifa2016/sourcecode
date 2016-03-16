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
    
//    var section1 : Int = 0
//    var section2 : Int!
//    var section3 : Int!
//    var section4 : Int!
//    var section5 : Int!
    //MARK: Properties
   // var match = [Match]()
    
    var parsedArray : NSMutableArray!
    
    var array1 : NSMutableArray = NSMutableArray()
    var array2 : NSMutableArray = NSMutableArray()
    var array3 : NSMutableArray = NSMutableArray()
    var array4 : NSMutableArray = NSMutableArray()
    var array5 : NSMutableArray = NSMutableArray()
    var dict1:[String:AnyObject] = [:]
    var dict2:[String:AnyObject] = [:]
    var dict3:[String:AnyObject] = [:]
    var dict4:[String:AnyObject] = [:]
    var dict5:[String:AnyObject] = [:]
    
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
                
                /* khushboo            {
                    var array1:[NSDictionary] = []
                    let arrayTwo:[String] = ["group_stage","round_of_16","quater_final","semifinal","final"]
            
                    for index in response.objectForKey("matchesInfo") as! NSArray
                    {
                        
                        if index.objectForKey("group_stage")as! String == "1"
                        {
                           
                            
                        array1 += [index as! NSDictionary]
                             self.dict1   = ["groupName":arrayTwo[0],"groupInfo":array1]
                            
                            
                        }
                        else if  index.objectForKey("round_of_16")as! String == "1"
                        {
                            
                            array2 += [index as! NSDictionary]
                            
                            self.dict2   = ["groupName":arrayTwo[1],"groupInfo":array2]
                           
                            
                            
                        }
                        
                        else if index.objectForKey("quater_final")as! String == "1"
                        {
                            array3 += [index as! NSDictionary]
                             self.dict3   = ["groupName":arrayTwo[2],"groupInfo":array3]
                            
                        }
                        
                        else if index.objectForKey("semifinal")as! String == "1"
                        {
                            array4 += [index as! NSDictionary]
                             self.dict4   = ["groupName":arrayTwo[3],"groupInfo":array4]
                            
                          
                        }
                        else if index.objectForKey("final")as! String == "1"
                        {
                            array5 += [index as! NSDictionary]
                             self.dict5   = ["groupName":arrayTwo[4],"groupInfo":array5]
                            
                        }

                        
                    }
            
                    print(self.dict1);
            
                    self.array += [self.dict1,self.dict2,self.dict3,self.dict4,self.dict5]

                     print(self.array)
                     self.matchTable.delegate = self
                     self.matchTable.dataSource = self
                    self.matchTable .reloadData()
            
                }
                *////

                
        }
        
        
        
        
        
        
        }
        
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        var sectionName : String =  ""
        switch (section)
        {
        case 0:
            sectionName = " sectionName 2"
            break;
        case 1:
            sectionName = "Section 2"
        case 2:
            sectionName = " sectionName 3"
            break;
        case 3:
            sectionName = "Section 4"
        
        case 2:
            sectionName = "Section 5"

        default:
            sectionName = ""
            break;
        }
        return sectionName
        
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
       vw.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        
        return vw
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
        
            
            cell.firstTeamLabel.text = self.array1[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array1[indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array1[indexPath.row]["team1_goals"]) :  \(self.array1[indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points

        case 1:
            cell.firstTeamLabel.text = self.array2[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array2[indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array2[indexPath.row]["team1_goals"]) :  \(self.array2[indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points

       case 2:
            cell.firstTeamLabel.text = self.array3[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array3[indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array3[indexPath.row]["team1_goals"]) :  \(self.array3[indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points
       case 3:
            cell.firstTeamLabel.text = self.array4[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array4[indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array4[indexPath.row]["team1_goals"]) :  \(self.array4[indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points
       case 4:
            cell.firstTeamLabel.text = self.array5[indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array5[indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array5[indexPath.row]["team1_goals"]) :  \(self.array5[indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points
            
        default:
            print("Done")
        }

          /*
            print(self.array[indexPath.section]["groupInfo"]![indexPath.row]["team1_name"] as? String)
            
            cell.firstTeamLabel.text = self.array[indexPath.section]["groupInfo"]![indexPath.row]["team1_name"] as? String
            
            cell.secondTeamLabel.text = self.array[indexPath.section]["groupInfo"]![indexPath.row]["team2_name"] as? String
            
            let points:String = "\(self.array[indexPath.section]["groupInfo"]![indexPath.row]["team1_goals"]) :  \(self.array[indexPath.section]["groupInfo"]![indexPath.row]["team2_goals"])"
            
            cell.pointsLabel.text =  points
        */
        
        
        
            
//            let imageUrl1 = NSURL(string: self.array[indexPath.section]["groupInfo"]!["team1_flag"]!  )
//            
//            cell.firstTeamImageView.sd_setImageWithURL(imageUrl1)
//            
//          let imageUrl2 = NSURL(string: self.array[indexPath.section]["groupInfo"]!["team2_flag"]!  )
//        
//            
//            cell.secondTeamImageView.sd_setImageWithURL(imageUrl2)
       
      
        
        
        //                    if height=="1"
        //                    {
        //                        cell.timeLabel.text=match[indexPath.section].matchDictArray[indexPath.row]["DayandDate"]
        //                    } else {
        //                      cell.timeLabel.hidden = true
        
        
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
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
