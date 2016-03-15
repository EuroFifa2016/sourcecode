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
        print(arrayOfImages)
        
        
       // setup()
    }

    override func viewDidLayoutSubviews() {
        let indexPath: NSIndexPath = NSIndexPath.init(forRow: i , inSection:0)
        
        galryCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        scrollViewMain.delegate = self
        scrollViewMain.maximumZoomScale = 4.0
        scrollViewMain.minimumZoomScale = 1.0
        scrollViewMain .addSubview(imageViewMain)
        
        let tapTwice = UITapGestureRecognizer(target: self, action: "zoomIn:")
        let tapOnce = UITapGestureRecognizer(target: self, action: "zoomOut:")
        tapTwice.numberOfTapsRequired = 2
        tapOnce.numberOfTapsRequired = 1
        tapOnce.delegate = self
        tapTwice.delegate = self
        
        scrollViewMain.delegate = self
        scrollViewMain.bouncesZoom = true
        scrollViewMain.decelerationRate = UIScrollViewDecelerationRateFast
        scrollViewMain.addGestureRecognizer(tapTwice)
        scrollViewMain.addGestureRecognizer(tapOnce)

    }
    
    func zoomIn(recognizer:UITapGestureRecognizer){
        
        let touchPoint: CGPoint = recognizer.locationInView(imageViewMain)
        let newZoomScale: CGFloat = (scrollViewMain.maximumZoomScale + scrollViewMain.minimumZoomScale) / 2
       self.zoomToPoint(touchPoint, withScale: newZoomScale, animated: true)
        
     imageViewMain.transform = CGAffineTransformMakeScale(2, 2)
        scrollViewMain .layoutSubviews()
        
       // scrollViewMain.contentSize = CGSize(width:self.view.frame.width*2, height: self.view.frame.height*2);
        
       /* if(scrollViewMain.zoomScale != scrollViewMain.minimumZoomScale){
            if isDoubleTap == false {
                scrollViewMain.setZoomScale(scrollViewMain.minimumZoomScale, animated: true)
                scrollViewMain .layoutSubviews()
            }
            isFirstTap = true
            isDoubleTap = true
        }else
        {
            if isDoubleTap {
                
                let touchPoint: CGPoint = recognizer.locationInView(imageViewMain)
                let newZoomScale: CGFloat = (scrollViewMain.maximumZoomScale + scrollViewMain.minimumZoomScale) / 2
                self.zoomToPoint(touchPoint, withScale: newZoomScale, animated: true)

            }
        }*/

    }
    
    
    
    func zoomOut(sender: UITapGestureRecognizer)
    {
//        if scrollViewMain.zoomScale != scrollViewMain.minimumZoomScale{
//        scrollViewMain.setZoomScale(scrollViewMain.minimumZoomScale, animated:true)
//        scrollViewMain.layoutSubviews()
//        }
        scrollViewMain.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);
       imageViewMain.transform = CGAffineTransformIdentity
    }
    
    func zoomToPoint(zoomPoint: CGPoint, withScale scale: CGFloat, animated: Bool) {
        let xsize: CGFloat = self.view.bounds.size.width / scale
        let ysize: CGFloat = self.view.bounds.size.height / scale
        scrollViewMain.zoomToRect(CGRectMake(zoomPoint.x - xsize / 2, zoomPoint.y - ysize / 2, xsize, ysize), animated: true)
    }
    
  
    // Delegates Method Of Collection View
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return arrayOfImages.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath)
        scrollViewMain = (cell.contentView.viewWithTag(202) as? UIScrollView)!
            imageViewMain = (cell.contentView.viewWithTag(201) as? UIImageView)!
            let url = NSURL(string: (arrayOfImages[ indexPath.row].valueForKey("path") as? String)!)
        
         imageViewMain.sd_setImageWithURL(url!, placeholderImage: UIImage(named: "icon"))
                   
        let tapTwice = UITapGestureRecognizer(target: self, action: "zoomIn:")
        let tapOnce = UITapGestureRecognizer(target: self, action: "zoomOut:")
        tapTwice.numberOfTapsRequired = 2
        tapOnce.numberOfTapsRequired = 1
        tapTwice.delegate = self
        tapOnce.delegate = self
        
        scrollViewMain.delegate = self
        scrollViewMain.bouncesZoom = true
        scrollViewMain.decelerationRate = UIScrollViewDecelerationRateFast

        scrollViewMain.addGestureRecognizer(tapTwice)
        scrollViewMain.addGestureRecognizer(tapOnce)
      

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
        
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return imageViewMain
    }
    
    
}
