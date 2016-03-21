//
//  CountriesViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 27/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CountryCell"

class CountriesViewController: ActivityIndicatorViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var countryCollectionView: UICollectionView!
    var countries = [Country]()
    var height = UIScreen.mainScreen().bounds.size.height
    
    // MARK: Actions
    @IBAction func skipButtonAction(sender: AnyObject) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let playerId = userDefaults .valueForKey("playerId") as? String
        {
            print(playerId)
            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        else
        {
            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("PlayersViewController") as! PlayersViewController
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }

    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self .automaticallyAdjustsScrollViewInsets = false
        
        
        // Load the sample data.
        self .getCountries()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:GET COUNTRIES
    func getCountries()
    {
        super.progressBarDisplayer(true, view: self.view)
        DataManager.GETAPI("selectYourTeam")
            {
                (response) -> Void in
                super.progressBarDisplayer( false, view: self.view)
                if response.objectForKey("result") as? Bool == true {
                    print(response)
                    
                    for index in response.objectForKey("teamInfo") as! NSArray
                    {
                        
                        let fileUrl = NSURL(string: index.objectForKey("team_flag")as! String)
                        
                        let teamName = (index.objectForKey("team_name") ?? "") as! String
                        let teamId = (index.objectForKey("id") ?? "") as! String
                        let country = Country(name: teamName, photoURL:fileUrl! ,id: teamId)
                        self.countries += [country]
                        
                    }
                    
                    self.countryCollectionView.reloadData()
                }
                
                
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        // Collection view cells are reused and should be dequeued using a cell identifier.
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CountryCell
        
        // Fetches the appropriate country for the data source layout.
        let country = countries[indexPath.row]
        cell.flagLabel.text = country.name;
        cell.countryImageView.sd_setImageWithURL(country.photoURL)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
   func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            return CGSize(width: countryCollectionView.frame.size.width/3.02, height:height/8)
            
    }
    
   
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        super.progressBarDisplayer(
            true, view: self.view)
        
        let country = countries[indexPath.row]
        let defaults = NSUserDefaults.standardUserDefaults()
        let deviceToken:String =  (defaults .objectForKey("deviceToken") as? String)!
        let SaveTeamDict:[String:AnyObject] = ["device_token":deviceToken,"team_id":country.id]
        
        //Have to change after webservice work
        //        userdetails.userCountry = country.id
        //        print( userdetails.userCountry)
        
      
        DataManager.API("saveYourTeam", jsonString: SaveTeamDict) { (response) -> Void in
            
            super.progressBarDisplayer(
                false, view: self.view)
            
            
            if response.objectForKey("result") as? Bool == true
            {
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(country.id, forKey: "countryId")
                
                if let playerId = userDefaults .valueForKey("playerId") as? String
                {
                    print(playerId)
                    let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
                    
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                else
                {
                    let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("PlayersViewController") as! PlayersViewController
                    
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                
                print(response)
                

            }
            else
            {
                print("error")
            }
            
            
            
        }
        
    }
    
    
}
