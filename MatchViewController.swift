//
//  MatchViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 15/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    
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
        
        
        let match1 = Match(matchStage: "   Group Stage Matches", matchDictArray: [["team1Image":"team1", "team1Name":"India", "teamPoints":"1 : 1","team2Name":"Pakistan","team2Image":"team-flag-2","DayandDate":"SAT 17/10/2015","isFirst":"1"],["team1Image":"team1", "team1Name":"England", "teamPoints":"19:00 hours Group - A","team2Name":"USA","team2Image":"team-flag-2","DayandDate":"SAT 17/10/2015","isFirst":"0"],["team1Image":"team1", "team1Name":"Brazil", "teamPoints":"3:00 hours Group - A","team2Name":"Croatia","team2Image":"team-flag-2","DayandDate":"SAT 18/10/2015","isFirst":"1"],["team1Image":"team1", "team1Name":"Chile", "teamPoints":"14:00 hours Group - A","team2Name":"Germany","team2Image":"team-flag-2","DayandDate":"SAT 18/10/2015","isFirst":"0"],["team1Image":"team1", "team1Name":"Australia", "teamPoints":"17:00 hours Group - A","team2Name":"Mali","team2Image":"team-flag-2","DayandDate":"SAT 18/10/2015","isFirst":"0"],["team1Image":"team1", "team1Name":"Belgium", "teamPoints":"20:00 hours Group - B","team2Name":"Ecuador","team2Image":"team-flag-2","DayandDate":"SAT 18/10/2015","isFirst":"0"],["team1Image":"team1", "team1Name":"Hunduras", "teamPoints":"22:00 hours Group - B","team2Name":"India","team2Image":"team-flag-2","DayandDate":"SAT 19/10/2015","isFirst":"1"]])
        
        
            match += [match1]
        
       
        
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return match.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return match[section].matchDictArray.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let height=(match[indexPath.section].matchDictArray[indexPath.row]["isFirst"])!as NSString
        if height=="1"
        {
            return 64
        } else {
            return 44
        }

    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchTableViewCell", forIndexPath: indexPath) as! MatchTableViewCell
        
        
        cell.firstTeamLabel.text = match[indexPath.section].matchDictArray[indexPath.row]["team1Name"]
        
        cell.secondTeamLabel.text = match[indexPath.section].matchDictArray[indexPath.row]["team2Name"]
        
        cell.pointsLabel.text =  match[indexPath.section].matchDictArray[indexPath.row]["teamPoints"]
        
        cell.firstTeamImageView.image = UIImage(imageLiteral:match[indexPath.section].matchDictArray[indexPath.row]["team1Image"]! )
        
        cell.secondTeamImageView.image = UIImage(imageLiteral:match[indexPath.section].matchDictArray[indexPath.row]["team2Image"]! )

        let height=(match[indexPath.section].matchDictArray[indexPath.row]["isFirst"])!as NSString
        if height=="1"
        {
            cell.timeLabel.text=match[indexPath.section].matchDictArray[indexPath.row]["DayandDate"]
        } else {
            cell.timeLabel.hidden = true
        }

        
        
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
        
        let header = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 25))
        header.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        
//        let imageView=UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, 30))
//        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
//        header.addSubview(imageView)
        
        let label = UILabel(frame: CGRectMake(0, 0, header.frame.size.width-50, 25))
       
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor .whiteColor()
        label.font = UIFont(name: "Quicksand-Regular", size: 14)
        label.text = match[section].matchStage as String
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
