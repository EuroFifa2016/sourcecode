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
    var matchgroup : String 
    var matchDict: [String:String] = [:]
    
    
    //MARK:Initialization
    init(matchgroup:String ,matchDict:[String:String])
    {
       
        self.matchDict = matchDict
        self.matchgroup = matchgroup
        
    }
    
    
    
}