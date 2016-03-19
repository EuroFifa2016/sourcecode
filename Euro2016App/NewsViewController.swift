//
//  NewsViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 04/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class NewsViewController: ActivityIndicatorViewController,UITableViewDataSource {
    
    var playerViewController = AVPlayerViewController()
    var  player = AVPlayer()

    @IBOutlet var tableView: UITableView!
    var news = [News]()
    var rowHeight : CGFloat = 300.0
    var video = []
    
    var refreshControl = UIRefreshControl()
    enum NSComparisonResult : Int {
        case OrderedAscending
        case OrderedSame
        case OrderedDescending
    }
    
    //MARK: View Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "News"

    }

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.tableView.rowHeight = 212;

        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
       // self .configureTableView()
       // self.loadSampleNews()
        self.loadSampleNews()
        
        refreshControl.addTarget(self, action: "didRefershList", forControlEvents: .ValueChanged)
        self.tableView.addSubview(refreshControl)
        // Do any additional setup after loading the view.
    }

   

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:Helper Function
    func loadSampleNews()
    {
        super.progressBarDisplayer( true, view: self.view)
        DataManager.GETAPI("getNewsFeed") { (response) -> Void in
            super.progressBarDisplayer( false, view: self.view)
            if response.objectForKey("result") as? Bool == true {
                
                print(response)
               for index in response.objectForKey("newsInfo") as! NSArray
                {
                   
                    
                    let news = (index.objectForKey("title") ?? "") as! String
                    let descriptionNews = (index.objectForKey("description") ?? "") as! String
                    
                    let date = (index.objectForKey("date") ?? "") as! String
                    let gallery = (index.objectForKey("gallery") ?? "") as! NSArray
                
                   let type = (index.objectForKey("type") ?? "") as! String
                  
                    let newsObj = News(news: news, date: date, gallery: gallery, descriptionNews: descriptionNews, typeOf: type)
                    
                    
                    self.news += [newsObj]
                    
                    
                }
                
                self.tableView .reloadData()
              
            }
            
            
        }
    }

   
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return news.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
       
               let cellIdentifier = "NewsCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NewsCell
        cell.backgroundColor = UIColor.clearColor()
        
        
        let newObj = news[indexPath.row]
        print(newObj)
                cell.newsLabel.text = newObj.news
                cell.dateLabel.text = newObj.date
        
            let typeLabel: UIImageView = cell.contentView.viewWithTag(999) as! UIImageView
            typeLabel.hidden =  true
            let type = Int(newObj.typeOf)
        print(type)
        if type == 2 {
            typeLabel.hidden = false
           let imageUrl = NSURL(string: newObj.gallery.valueForKey("screenshot").objectAtIndex(0) as! String)
            
            
            cell.newsImageView.sd_setImageWithURL(imageUrl)
        }
        else
        {
            let imageUrl = NSURL(string: newObj.gallery.valueForKey("path").objectAtIndex(0) as! String)
            let test = NSURL(string:"")
           cell.newsImageView.sd_setImageWithURL(test!, placeholderImage: UIImage(named: "icon"))

        
        getDataFromUrl(imageUrl!) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                
                let newImage: UIImage = UIImage(data: data)!
                
                
                cell.newsImageView.image = self.resizeImage(newImage, newWidth:cell.newsImageView.frame.size.width)
               
           }
            }
            
        }

        return cell
      
        
    }
    
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        
    }
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        print("cell row height,\(newHeight)")
  print("cell row height,\(newHeight)")
        
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
   
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        print("Count ,\(news.count)")
        print("Count ,\(indexPath.row)")
        let newObj = news[indexPath.row]
        if  newObj.typeOf == "2"
        {
        }
        else
{
        print("ObjeH ,\(newObj.gallery.valueForKey("height").objectAtIndex(0))")
        print("Objew,\(newObj.gallery.valueForKey("width").objectAtIndex(0))")
    let StrWidth :String = newObj.gallery.valueForKey("width").objectAtIndex(0) as! String
    let StrHeight : String = newObj.gallery.valueForKey("height").objectAtIndex(0) as! String
            let width = Double(StrWidth)
            let height = Double(StrHeight)
    
            let apect: Double = width! / height!
            let nHeight: Double = Double(tableView.frame.size.width) / apect
    
    print("cell row height,\(nHeight)")
    
     rowHeight = CGFloat(nHeight)

        }
        
      
    
            return rowHeight


    }
    
    // Pull to refresh
    
    func didRefershList(){
        
        
        
        super.progressBarDisplayer( true, view: self.view)
        DataManager.GETAPI("getNewsFeed") { (response) -> Void in
            super.progressBarDisplayer( false, view: self.view)
            if response.objectForKey("result") as? Bool == true {
                
                print(response)
                for index in response.objectForKey("newsInfo") as! NSArray
                {
                    
                    
                    let news = (index.objectForKey("title") ?? "") as! String
                    let descriptionNews = (index.objectForKey("description") ?? "") as! String
                    
                    let date = (index.objectForKey("date") ?? "") as! String
                    let gallery = (index.objectForKey("gallery") ?? "") as! NSArray
                    
                    let type = (index.objectForKey("type") ?? "") as! String
                    
                    let newsObj = News(news: news, date: date, gallery: gallery, descriptionNews: descriptionNews, typeOf: type)
                    
                    
                    self.news += [newsObj]
                    
                    
                }
                
                
               // self.tableView .reloadData()
                
            }
            
        }

        
        
        //tableView.reloadData()
        print("refresh")
        refreshControl.endRefreshing()
    }
    
    // MARK: - Table view Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


        let cell :UITableViewCell =  tableView.cellForRowAtIndexPath(indexPath)!
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None

       
        let newObj = news[indexPath.row]
        
       
        if newObj.typeOf == "2"{
            
            let imageUrl = NSURL(string: newObj.gallery.valueForKey("screenshot").objectAtIndex(0) as! String)
           
           
            
            
            print(newObj.gallery.valueForKey("path"))
            let viewController = storyboard!.instantiateViewControllerWithIdentifier("VideoViewController") as! VideoViewController
            viewController.urlString = newObj.gallery.valueForKey("path").objectAtIndex(0) as! String
            viewController.prevImage = imageUrl!
            viewController.date = newObj.date
            viewController.videoTitle = newObj.news
            viewController.videoDescription = newObj.descriptionNews
             print(viewController.videoDescription)
            self.navigationController?.pushViewController(viewController, animated: true)
            
            
            
//            let videoURL = NSURL(string:  newObj.gallery.valueForKey("path").objectAtIndex(0) as! String)
//
//            let player = AVPlayer(URL: videoURL!)
//            
//            playerViewController.player = player
//
//            self.presentViewController(playerViewController, animated: true) {
//                self.playerViewController.player!.play()
//            }
  
          
        }
        else{
        let viewController = storyboard!.instantiateViewControllerWithIdentifier("NewsGalleryViewController") as! NewsGalleryViewController
       
        viewController.arr_galary = newObj.gallery
        
        self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        
    }
     
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "ShowDetail" {
            
          //  let mealDetailViewController = segue.destinationViewController as! NewsDetailViewController
            
            
//            if let selectedMealCell = sender as? MealTableViewCell {
//                
//                let indexPath = tableView.indexPathForCell(selectedMealCell)!
//                let selectedMeal = meals[indexPath.row]
//                mealDetailViewController.meal = selectedMeal
//                
//            }
        }
       
        
        
    }
    

}
