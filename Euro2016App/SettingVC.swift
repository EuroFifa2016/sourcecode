//
//  SettingVC.swift
//  Euro2016App
//
//  Created by Amit Verma on 2/24/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    var arr_SettingTitle = ["My Account","Change Password","Notifications","Terms & Conditions","About?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

    // DataSource Method of UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_SettingTitle .count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath)
        
        print(arr_SettingTitle)
        
        cell.textLabel?.text = arr_SettingTitle[indexPath.row] as String
        return cell
    }
    

}
