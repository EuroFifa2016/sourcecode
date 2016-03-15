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
      self.navigationItem.title = "PLAYER"
        
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
            let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
            // 2
            let blurView = UIVisualEffectView(effect: lightBlur)
            blurView.frame = blurImageView.bounds
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
        
        weight.text = playerdetails.weight
        
        
        let height = self.view.viewWithTag(3) as! UILabel
        
        height.text = playerdetails.height
        
        
        let dob = self.view.viewWithTag(4) as! UILabel
        
        dob.text = playerdetails.birthDate
        
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
        nationFlag.sd_setImageWithURL(nationUrl)
        
        let teamFlag = self.view.viewWithTag(13) as! UIImageView
        let teamUrl =  NSURL(string: playerdetails.nationFlag)
        teamFlag.sd_setImageWithURL(teamUrl)
        
        return cell
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
