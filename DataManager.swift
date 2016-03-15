//
//  DataManager.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 18/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import Foundation
import Alamofire
let EuroAppURL = "http://dev614.trigma.us/euro2016/webservices/"
class DataManager {
  
  
  
  //MARK:Functions
  
  class func API(api:NSString,jsonString:[String: AnyObject],success: ((response: NSDictionary) -> Void)) -> Void{
    let apiString = EuroAppURL + (api as String)
    print(apiString)
    let url: NSURL = NSURL(string: apiString as String)!
    
    Alamofire.request(.POST, url, parameters: jsonString)
      
      .responseJSON
      {
        response in
        if let JSON = response.result.value as? NSDictionary {
          
          success(response: JSON)
        }
        else
        {
          
        }
    }
    
  }
  
  
  class func GETAPI(api:NSString ,success: ((response: NSDictionary) -> Void)) -> Void{
    let apiString = EuroAppURL + (api as String)
    print(apiString)
    let url: NSURL = NSURL(string: apiString as String)!
    
    Alamofire.request(.GET, url)
      .responseJSON { response in
        
        if let JSON = response.result.value as? NSDictionary {
          
          success(response: JSON)
        }
        else
        {
          
        }
    }
    
    
  }
}


  