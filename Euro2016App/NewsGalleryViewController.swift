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
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "GALLERY"
        // title = "GALLERY"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        print(arr_galary.count)
        
       
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
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.grayColor().CGColor
            
            
            
            
            
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
}



