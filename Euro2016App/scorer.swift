//
//  scorer.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 10/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class scorer: NSObject {

    
    //MARK: Properties
    var scorerName : String
    var countryName : String
    var scorerPhoto : UIImage
    var mgPoint :String
    var miss_goal :String
    
    
    //MARK:Initialization
    init(scorerName:String, countryName:String, scorerPhoto:UIImage,mgPoint:String,miss_goal:String)
    {
        self.scorerName = scorerName
        self.countryName = countryName
        self.scorerPhoto = scorerPhoto
        self.mgPoint = mgPoint
        self.miss_goal = miss_goal
        
        super.init()
    }

}
