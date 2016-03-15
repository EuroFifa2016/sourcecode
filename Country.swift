//
//  Country.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 25/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//


import UIKit

class Country:NSObject
{
    // MARK: Properties
    
    var name: String
    var photoURL: NSURL
    var id:String
    
    // MARK: Initialization
    init(name: String, photoURL: NSURL,id:String) {
        
        self.name = name
        self.photoURL = photoURL
        self.id = id
        super.init()
        
      
    }


}
