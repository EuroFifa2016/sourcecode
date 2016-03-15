//
//  NewsDetailViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 10/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
//MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView: ParallaxHeaderView = ParallaxHeaderView.parallaxHeaderViewWithImage(UIImage(named: "news-img3"), forSize: CGSizeMake(self.view.frame.size.width, 160)) as! ParallaxHeaderView
        self.tableView.tableHeaderView = headerView


        // Do any additional setup after loading the view.
    }
    
    func  scrollViewDidScroll(scrollView: UIScrollView) {
        let header: ParallaxHeaderView = self.tableView.tableHeaderView as! ParallaxHeaderView
        header.layoutHeaderViewForScrollViewOffset(scrollView.contentOffset)
        
        self.tableView.tableHeaderView = header
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NewsDetailCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NewsDetailCell
        
        return cell
    }
    // MARK: Navigation
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
//            let name = nameTextFeld.text ?? ""
//            let photo = photoImageView.image
//            let rating = ratingControl.rating
//            // Set the meal to be passed to MealTableViewController after the unwind segue.
//            meal = Meal(name: name, photo: photo, rating: rating)
        
           
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
}
