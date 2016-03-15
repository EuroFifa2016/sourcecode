//
//  ScorerViewController.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 10/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class ScorerViewController: UIViewController {
    
    // MARK: Properties
    
    var scorers = [scorer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self .loadScorerPlayers()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func loadScorerPlayers(){
        
        let scorerphoto1 = UIImage(named: "Image16")
        let  scorer1 = scorer(scorerName: "Messi", countryName: "Argentina", scorerPhoto: scorerphoto1!, mgPoint: "23", miss_goal: "12 min")
        
        let scorerphoto2 = UIImage(named: "img2")
        let  scorer2 = scorer(scorerName: "Ronaldo", countryName: "Germany", scorerPhoto: scorerphoto2!, mgPoint: "22", miss_goal: "89 min")
        scorers += [scorer1,scorer2]
    }


    // delegates of tableView


        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return scorers.count
        }


        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "ScorerCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ScorerCell
            cell.accessoryView = UIImageView(image: (UIImage(named: "list-bg")))
            let scorer = scorers[indexPath.row]
            cell.playerName.text = scorer.scorerName
            cell.playerImage.image = scorer.scorerPhoto
            cell.countryName.text = scorer.countryName
            cell.mgLabel.text = scorer.mgPoint
            cell.miss_goalLabel.text = scorer.miss_goal
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
}

