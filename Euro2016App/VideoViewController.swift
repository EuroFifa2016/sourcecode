//
//  VideoViewController.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 12/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoImageView: UIImageView!
    var playerViewController = AVPlayerViewController()
    var  player = AVPlayer()
    var urlString = String()
    var prevImage = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoImageView.sd_setImageWithURL(prevImage)
        
    }
  
    @IBAction func playVideoBtn(sender: AnyObject) {
        let videoURL = NSURL(string:  urlString)
        
        let player = AVPlayer(URL: videoURL!)
        
        playerViewController.player = player
        
        self.presentViewController(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
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
