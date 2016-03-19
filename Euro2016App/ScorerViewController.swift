//
//  ScorerViewController.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 10/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class ScorerViewController: ActivityIndicatorViewController,UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView_Score: UITableView!
    var scorers = [PlayerDetail]()
    var arr_ScoreDetail = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "SCORER"

        // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(animated: Bool) {
        self .loadScorerPlayers()
 self.navigationController?.navigationBar.topItem?.title = "SCORER"
    
        //self.navigationController?.navigationBar.topItem?.title = "News"
        
        
        
        //Remove  values from Instance class
        
        playerdetails.playerImage = ""
        playerdetails.playerName = ""
        playerdetails.weight = ""
        playerdetails.height =  ""
        playerdetails.birthDate = ""
        playerdetails.nationality = ""
        playerdetails.nationFlag = ""
        playerdetails.teamFlag = ""
        playerdetails.team = ""
        
        playerdetails.position = ""
        playerdetails.shirtNumber = ""
        // End of Code
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func loadScorerPlayers(){
        
        super.progressBarDisplayer(true, view: self.view)
        DataManager.GETAPI("getTopScorers") { (response) -> Void in
            super.progressBarDisplayer(false, view: self.view)
            if response.objectForKey("result") as? Bool == true {
                
                print(response)

                
                self.arr_ScoreDetail = response.valueForKey("playersInfo") as! NSMutableArray
                
                if self.arr_ScoreDetail .count > 0
                {
                    self.tableView_Score .reloadData()
                }
               
            }
        }
    }
    
    
    // delegates of tableView
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arr_ScoreDetail.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ScorerCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ScorerCell
        cell.accessoryView = UIImageView(image: (UIImage(named: "list-bg")))
        //let scorer = scorers[indexPath.row]
        cell.playerName.text = self.arr_ScoreDetail[indexPath.row].valueForKey("player_name") as? String
        cell.mgLabel.text = self.arr_ScoreDetail[indexPath.row].valueForKey("goals") as? String
        cell.countryName.text = self.arr_ScoreDetail[indexPath.row].valueForKey("nationality") as? String
        cell.miss_goalLabel.text = (self.arr_ScoreDetail[indexPath.row].valueForKey("mins_goals") as? String)! + " min"
        
        let url = NSURL(string: (self.arr_ScoreDetail[indexPath.row].valueForKey("player_image") as? String)!)
       // let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
    //     let image = UIImage(data: data!)
        
       cell.playerImage.sd_setImageWithURL(url)
     //   cell.playerImage.image = image
//        cell.playerImage.backgroundColor = UIColor.redColor()
//        cell.playerImage.layer.cornerRadius = cell.playerImage.frame.size.width / 2;
//        cell.playerImage.clipsToBounds = true
        
        cell.playerImage.contentMode = UIViewContentMode.ScaleAspectFill
        if indexPath.row%2==0
        {
            cell.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1)
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        return cell
        
    }
    
//    func maskRoundedImage(image: UIImage, radius: Float) -> UIImage {
//        let imageView: UIImageView = UIImageView(image: image)
//        var layer: CALayer = CALayer()
//        layer = imageView.layer
//        
//        layer.masksToBounds = true
//        layer.cornerRadius = CGFloat(radius)
//        
//        UIGraphicsBeginImageContext(imageView.bounds.size)
//        layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return roundedImage
//    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //let cell :UITableViewCell =  tableView.cellForRowAtIndexPath(indexPath)!
         let playerInfoVC = storyboard?.instantiateViewControllerWithIdentifier("PlayerInfoViewController")as! PlayerInfoViewController
        
        playerdetails.playerImage = arr_ScoreDetail.valueForKey("player_image").objectAtIndex(indexPath.row) as! String
        playerdetails.playerName =   arr_ScoreDetail.valueForKey("player_name").objectAtIndex(indexPath.row) as! String
        playerdetails.weight =  arr_ScoreDetail.valueForKey("weight").objectAtIndex(indexPath.row) as! String
        playerdetails.height =  arr_ScoreDetail.valueForKey("height").objectAtIndex(indexPath.row) as! String
        playerdetails.birthDate =  arr_ScoreDetail.valueForKey("dob").objectAtIndex(indexPath.row) as! String
        playerdetails.nationality =  arr_ScoreDetail.valueForKey("nationality").objectAtIndex(indexPath.row) as! String
        playerdetails.nationFlag =  arr_ScoreDetail.valueForKey("team_flag").objectAtIndex(indexPath.row) as! String
        playerdetails.teamFlag =  arr_ScoreDetail.valueForKey("team_logo").objectAtIndex(indexPath.row) as! String
        playerdetails.team =  arr_ScoreDetail.valueForKey("team_name").objectAtIndex(indexPath.row) as! String
        playerdetails.position =  arr_ScoreDetail.valueForKey("position").objectAtIndex(indexPath.row) as! String
        playerdetails.shirtNumber =  arr_ScoreDetail.valueForKey("shirt_number").objectAtIndex(indexPath.row) as! String
        
        
       
        self.navigationController?.pushViewController(playerInfoVC, animated: true)
    }
    
    
    
}

