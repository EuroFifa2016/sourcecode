//
//  PlayerDetail.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 15/03/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class PlayerDetail
{
    
    var playerImage: String
    var playerName: String
    var weight: String
    var height: String
    var birthDate: String
    var nationality : String
    var nationFlag: String
    var teamFlag: String
    var team: String
    var position: String
    var shirtNumber: String
    
    
    
    init(playerImage: String,playerName: String,weight: String,height: String,birthDate: String,nationality : String,nationFlag: String,teamFlag: String,team: String,position: String,shirtNumber: String) {
        
        self.playerImage = playerImage
        self.playerName = playerName
        self.weight = weight
        self.height = height
        self.birthDate = birthDate
        self.nationality = nationality
        self.nationFlag = nationFlag
        self.teamFlag = teamFlag
        self.team = team
        self.position = position
        self.shirtNumber = shirtNumber
        
    }
    
  

}

  var playerdetails = PlayerDetail(playerImage:"", playerName:"", weight:"", height:"", birthDate:"", nationality:"", nationFlag:"", teamFlag:"", team:"", position:"", shirtNumber:"")
