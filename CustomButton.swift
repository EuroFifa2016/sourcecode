//
//  CustomButton.swift
//  Euro2016App
//
//  Created by Khushboo on 3/12/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
   var parent:UIViewController?
    
    
    override func drawRect(rect: CGRect)
    {
        
        self.frame = frame
        self.setImage(UIImage(named: "back"), forState: .Normal)
        self.addTarget(self, action: "homeButtonClicked:", forControlEvents: .TouchUpInside)
    }

    
    func homeButtonClicked(sender: CustomButton) {
        sender.parent!.navigationController!.popViewControllerAnimated(true)
    }
    
   
  class  func setBackBarButtonItem(viewCon: UIViewController) {
        
        let btn: CustomButton = CustomButton(frame: CGRectMake(0.0, 0.0, 7.0, 12.0))
        btn.parent = viewCon
        let eng_btn: UIBarButtonItem = UIBarButtonItem(customView: btn)
        viewCon.navigationItem.leftBarButtonItem = eng_btn
    }

   
    

}

