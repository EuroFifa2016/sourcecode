//
//  PlayersViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 28/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class PlayersViewController: ActivityIndicatorViewController {
    
    // MARK: Actions
    
    
    
    
    // MARK: Properties
    
    var players = [Player]()
    
    @IBOutlet weak var table_View: UITableView!
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomButton.setBackBarButtonItem(self)
       
        self .automaticallyAdjustsScrollViewInsets = false
        // Load the sample data.
        self .loadSamplePlayers()
        
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Helper Functions
    func loadSamplePlayers()
    {
        
        super.progressBarDisplayer( true, view: self.view)
        DataManager.GETAPI("selectYourPlayer")
            {
                (response) -> Void in
                super.progressBarDisplayer( false, view: self.view)
                
                if response.objectForKey("result") as? Bool == true {
                    print(response)
                    
                    for index in response.objectForKey("playersInfo") as! NSArray
                    {
                        
                        let playerImageUrl = NSURL(string: index.objectForKey("player_image")as! String)
                        
                        let playerTeamUrl = NSURL(string: index.objectForKey("team_flag")as! String)
                        
                         let playerTeamName = (index.objectForKey("team_name") ?? "") as! String
              let playerId = (index.objectForKey("id") ?? "") as! String
                        let playerName = (index.objectForKey("player_name") ?? "") as! String
                        let player = Player(playerName: playerName, playerImageUrl: playerImageUrl!,playerTeamUrl: playerTeamUrl!,playerTeamName:playerTeamName,id:playerId)
                        self.players += [player]
                        
                        
                        
                    }
                    
                    self.table_View .reloadData()
                }
                else
                    
                {
                    print("error")
                }
                
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        
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
        
        return players.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlayerCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlayerCell
        
        // Fetches the appropriate player for the data source layout.
        let player = players[indexPath.row]
        cell.playerLabel.text = player.playerName
        cell.countryLabel.text = player.playerTeamName
        cell.countryImageView.sd_setImageWithURL(player.playerTeamUrl)
        cell.playerImageView.sd_setImageWithURL(player.playerImageUrl)
        
   
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        super.progressBarDisplayer(
            true, view: self.view)
        
        let player = players[indexPath.row]
        let defaults = NSUserDefaults.standardUserDefaults()
        let deviceToken:String =  (defaults .objectForKey("deviceToken") as? String)!
        let SaveTeamDict:[String:AnyObject] = ["device_token":deviceToken,"team_id":player.id]
        
        DataManager.API("saveYourTeam", jsonString: SaveTeamDict) { (response) -> Void in
            
            super.progressBarDisplayer(
                false, view: self.view)
            
            
            if response.objectForKey("result") as? Bool == true
            {
                let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
                
                self.navigationController?.pushViewController(viewController, animated: true)
                
            }
            else
            {
                print("error")
            }
            
            
            
        }
      }

    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
        
    
}
