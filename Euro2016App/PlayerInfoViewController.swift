//
//  PlayerInfoViewController.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 10/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    var arr_PlayerInfo = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_bg.png")!)


      self.navigationItem.title = "PLAYER 1"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
     
        print(playerdetails.playerImage,
        playerdetails.playerName,
        playerdetails.weight,
        playerdetails.height,
        playerdetails.birthDate,
        playerdetails.nationality,
        playerdetails.nationFlag,
        playerdetails.teamFlag,
        playerdetails.team,
        playerdetails.position,
        playerdetails.shirtNumber)
        
        // Do any additional setup after loading the view.
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
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlayerInfoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) 
        
        if let blurImageView = self.view.viewWithTag(99) as? UIImageView {
            // Creating Background Blur Effect of Profile Image
            // 1
            let blurImageUrl =  NSURL(string: playerdetails.playerImage)
            blurImageView.sd_setImageWithURL(blurImageUrl)
            let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            // 2
            let blurView = UIVisualEffectView(effect: lightBlur)
            blurView.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)
            blurView .alpha = 0.9
            // 3
            blurImageView.addSubview(blurView)
        }
        let imageUrl =  NSURL(string: playerdetails.playerImage)
        
        let profileImage: UIImageView = self.view.viewWithTag(11) as! UIImageView
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
         profileImage.sd_setImageWithURL(imageUrl)
        profileImage.backgroundColor = UIColor.redColor()
        profileImage.contentMode = UIViewContentMode.ScaleAspectFill
        
        let firstName = self.view.viewWithTag(1) as! UILabel
        
        firstName.text = playerdetails.playerName
        
        
        let weight = self.view.viewWithTag(2) as! UILabel
        
        weight.text = playerdetails.weight + "kg"
        
        
        let height = self.view.viewWithTag(3) as! UILabel
        
        height.text = playerdetails.height + "cm"
        
        
        let dob = self.view.viewWithTag(4) as! UILabel
       
       let AGE =   ageCalculator( playerdetails.birthDate)
        let MONTH = convertMonth(playerdetails.birthDate)
         dob.text = MONTH + "(" + AGE + "years" + ")"
        print(AGE)
        let nationality = self.view.viewWithTag(5) as! UILabel
        
        nationality.text = playerdetails.nationality
        
        
        
        let team = self.view.viewWithTag(6) as! UILabel
        
        team.text = playerdetails.team
        
        
        
        let pos = self.view.viewWithTag(7) as! UILabel
        
        pos.text = playerdetails.position
        
        
        let shrtNumber = self.view.viewWithTag(8) as! UILabel
        
        shrtNumber.text = playerdetails.shirtNumber
        
        let nationFlag = self.view.viewWithTag(12) as! UIImageView
        let nationUrl =  NSURL(string: playerdetails.nationFlag)
        nationFlag.layer.borderWidth = 0.6
        nationFlag.layer.borderColor = UIColor (red: 225/255, green: 225/255, blue: 225/255, alpha: 1).CGColor

        nationFlag.sd_setImageWithURL(nationUrl)
        
        let teamFlag = self.view.viewWithTag(13) as! UIImageView
        teamFlag.layer.borderWidth = 0.6
        teamFlag.layer.borderColor = UIColor (red: 225/255, green: 225/255, blue: 225/255, alpha: 1).CGColor
        

        let teamUrl =  NSURL(string: playerdetails.nationFlag)
        teamFlag.sd_setImageWithURL(teamUrl)
        
        return cell
    }
    
    func ageCalculator(age: String) -> String{
        let currentdate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: currentdate)
       
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.dateFromString(age)
        let ageComponents = calendar.components(.Year,
            fromDate: date!,
            toDate: currentdate,
            options: [])
        let year = String(ageComponents.year)

        
        return year
        
    }
    
    func convertMonth(month: String) -> String{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.dateFromString(month)
        print(date)
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
       // formatter.timeStyle = .ShortStyle
        
        let dateString = formatter.stringFromDate(date!)
        
        print(dateString)
        return dateString
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
