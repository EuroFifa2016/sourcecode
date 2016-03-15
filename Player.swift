//
//  Player.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 28/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//


import UIKit

class Player: NSObject
{
    //MARK: Properties
    var playerName : String
    var playerImageUrl : NSURL
    var playerTeamUrl : NSURL
    var playerTeamName : String
    var id:String
    
    //MARK:Initialization
    init(playerName:String, playerImageUrl : NSURL,playerTeamUrl:NSURL,playerTeamName:String,id:String)
    {
        self.playerName = playerName
        self.playerImageUrl = playerImageUrl
        self.playerTeamUrl = playerTeamUrl
        self.playerTeamName = playerTeamName
        self.id = id

    }
    
    
    
}

