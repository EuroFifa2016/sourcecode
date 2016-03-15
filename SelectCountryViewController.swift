//
//  SelectCountryViewController.swift
//  Euro2016App
//
//  Created by Khushboo on 3/11/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class SelectCountryViewController: UIViewController {

    //Mark:Properties
    var country:String?
    @IBOutlet weak var tableView: UITableView!
     var countries: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "COUNTRY OF RESIDENCE"
        CustomButton.setBackBarButtonItem(self)
        
        // =========== Table View(Upper View) Border Color and Border Width =======
        tableView.layer.borderColor = UIColor(red: 68.0 / 255.0, green: 68.0 / 255.0, blue: 68.0 / 255, alpha: 1).CGColor
        tableView.layer.borderWidth = 1.0
        tableView.layer.cornerRadius = 2.0
        
        // ========= Getting Country Codes and then getting List Of Countries and sorting it====
        
        var countryArray:[String] = []
        
        for code in NSLocale.ISOCountryCodes() as [String] {
            let id = NSLocale.localeIdentifierFromComponents([NSLocaleCountryCode: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayNameForKey(NSLocaleIdentifier, value: id) ?? "Country not found for code: \(code)"
            countryArray.append(name)
        }
        countries = countryArray.sort { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending }
        print(countries)
       
        


        // Do any additional setup after loading the view.
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
        
        
        cell.textLabel?.text = countries[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: "Quicksand-Regular", size: 17.0)

        return cell
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
      
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Update an existing meal.
          country =   countries[selectedIndexPath.row]
            
        }
        
                  
        }
        
  
}
