//
//  NewsGalleryViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 16/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit


class NewsGalleryViewController: UIViewController  {
    //    var dict = [String: String]()
    //    var Value : String = ""
    //    var KeyObject : String = ""
    var arr_galary = []
    //    var newArray = []
    //    var i = Int()
    //    var checkStatus : Int = 0
    var galleryName = []
    var rowHeight : CGFloat = 300.0
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "GALLERY"

        // title = "GALLERY"
        
       CustomButton.setBackBarButtonItem(self)
        print(arr_galary.count)
        
       
           }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationItem.title = "GALLERY"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_galary.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell1", forIndexPath: indexPath)
        
        if let imageView = cell.contentView.viewWithTag(101) as? UIImageView {
            
            let url = NSURL(string: (arr_galary[indexPath.row].valueForKey("path") as? String)!)
            
            imageView.sd_setImageWithURL(url!, placeholderImage: UIImage(named: "icon"))
            print(imageView.frame.size.width)
            print(imageView.frame.size.height)

            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.grayColor().CGColor
            
            getDataFromUrl(url!) { (data, response, error)  in
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    guard let data = data where error == nil else { return }
                    print(response?.suggestedFilename ?? "")
                    print("Download Finished")
                    
                    let newImage: UIImage = UIImage(data: data)!
                    
                    
                    imageView.image = self.resizeImage(newImage, newWidth:imageView.frame.size.width)
                    
                }
            }
            
            
            
        }
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        let galleryViewController = storyboard?.instantiateViewControllerWithIdentifier("GalleryViewController")as! GalleryViewController
        
        galleryViewController.arrayOfImages = arr_galary
        
        galleryViewController.i = indexPath.row
        
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row % 3 == 0 {
            return CGSizeMake(self.view.frame.size.width - 10, 150)
        }
        else {
            return CGSizeMake((self.view.frame.size.width + 8)/2 - 10 , 150)
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
        
    }
    
    internal  func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
            return 1
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
        
     
            print("ObjeH ,\(arr_galary.valueForKey("height").objectAtIndex(0))")
            print("Objew,\(arr_galary.valueForKey("width").objectAtIndex(0))")
            let StrWidth :String = arr_galary.valueForKey("width").objectAtIndex(0) as! String
            let StrHeight : String = arr_galary.valueForKey("height").objectAtIndex(0) as! String
            let width = Double(StrWidth)
            let height = Double(StrHeight)
            
            let apect: Double = width! / height!
            let nHeight: Double = Double(tableView.frame.size.width) / apect
            
            print("cell row height,\(nHeight)")
            
            rowHeight = CGFloat(nHeight)
            
        
        
        
        return rowHeight
        
        
    }

    
    
}



