//
//  Standing.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 12/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class Standing: NSObject
{
    //MARK: Properties
    var group : NSString
    var myNewDictArray: [[String:String]] = []
   
    
    //MARK:Initialization
    init(group:String,myNewDictArray:[[String:String]])
    {
     self.group = group
     self.myNewDictArray = myNewDictArray
        
    }
    
    
    
}


