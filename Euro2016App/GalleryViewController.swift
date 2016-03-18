//
//  GalleryViewController.swift
//  Euro2016App
//
//  Created by Sandeep kumar on 18/02/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController,UIScrollViewDelegate,UIGestureRecognizerDelegate,UICollectionViewDelegate{
    var imageViewMain: UIImageView = UIImageView()
    var scrollViewMain: UIScrollView = UIScrollView()
    var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var isFirstTap = false
    var isDoubleTap = false
    var gagViewDetail: UIView = UIView()
    
    @IBOutlet weak var galryCollectionView: UICollectionView!
    
  
    var i = Int()
    var currentImage : UIImage = UIImage()
    var arrayOfImages = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        print(arrayOfImages)
        print(self.view.frame.size.width)
        
    }

    override func viewDidLayoutSubviews() {
        let indexPath: NSIndexPath = NSIndexPath.init(forRow: i , inSection:0)
        
        galryCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Delegates Method Of Collection View
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return arrayOfImages.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        scrollViewMain.setZoomScale(scrollViewMain.minimumZoomScale, animated:true)
        scrollViewMain.layoutSubviews()

        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath)
        
       
        
        scrollViewMain = (cell.contentView.viewWithTag(202) as? UIScrollView)!
            imageViewMain = (cell.contentView.viewWithTag(201) as? UIImageView)!
            let url = NSURL(string: (arrayOfImages[ indexPath.row].valueForKey("path") as? String)!)
            imageViewMain.sd_setImageWithURL(url!, placeholderImage: UIImage(named: "icon"))
        
        let tapTwice = UITapGestureRecognizer(target: self, action: "zoom:")
        tapTwice.numberOfTapsRequired = 2
        tapTwice.numberOfTouchesRequired = 1
        tapTwice.delegate = self
        scrollViewMain.delegate = self
        scrollViewMain.bouncesZoom = true
     //   scrollViewMain.decelerationRate = UIScrollViewDecelerationRateFast

        scrollViewMain.addGestureRecognizer(tapTwice)
        
        return cell
    }
    
    func zoom(tapGesture: UITapGestureRecognizer) {
        if (scrollViewMain.zoomScale == scrollViewMain.minimumZoomScale) {
            
            scrollViewMain.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height * 2);
            scrollViewMain.setZoomScale(scrollViewMain.maximumZoomScale, animated:true)

        } else {
           // scrollViewMain.contentSize = CGSize(width: self.view.frame.width , height: self.view.frame.height );
            scrollViewMain.setZoomScale(scrollViewMain.minimumZoomScale, animated: true)
            imageViewMain.transform = CGAffineTransformIdentity
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
        
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return imageViewMain
    }
    
     func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            
          return CGSizeMake(self.view.frame.size.width , self.view.frame.size.height)

    }
    
    
}
