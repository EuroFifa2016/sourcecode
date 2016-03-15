//
//  Match.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 15/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import Foundation
import UIKit

class Match: NSObject
{
    //MARK: Properties
    var matchStage : NSString
    var matchDictArray: [[String:String]] = []
    
    
    //MARK:Initialization
    init(matchStage:String,matchDictArray:[[String:String]])
    {
        self.matchStage = matchStage
        self.matchDictArray = matchDictArray
        
    }
    
    
    
}