//
//  ActivityIndicatorViewController.swift
//  Euro2016App
//
//  Created by Iqbinder Brar on 19/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {

  
  
  
    
    var activityIndicator = UIActivityIndicatorView()

    
    func progressBarDisplayer(indicator:Bool, view:UIView) {
      
      if indicator{
        
        //println(msg)
//        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
//        strLabel.text = msg
//        strLabel.textColor = UIColor.blackColor()
//        strLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
//        msgFrame = UIView(frame: CGRect(x: 0, y: 0 , width: 150, height: 50))
        
        
        
//        msgFrame.layer.cornerRadius = 5
//        msgFrame.backgroundColor = UIColor .grayColor()
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator.color = UIColor .grayColor()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
//        msgFrame.addSubview(activityIndicator)
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
//        msgFrame.addSubview(strLabel)
        view.addSubview(activityIndicator)
      }else{
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
       // msgFrame.removeFromSuperview()
        activityIndicator.removeFromSuperview()
      }
      
    }

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
