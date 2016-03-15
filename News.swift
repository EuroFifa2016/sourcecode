//
//  News.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 05/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class News:NSObject
{
    // MARK: Properties
    var news: String
    var date: String
    
    var gallery:NSArray
    var descriptionNews: String
    
    var typeOf : String
    // MARK: Initialization
    init(news: String,date: String, gallery:NSArray,descriptionNews: String, typeOf:String)
    {
        self.news = news
        self.date = date
        
        self.gallery = gallery
        self.descriptionNews = descriptionNews
        self.typeOf = typeOf
        super.init()
    }
    
    
}
