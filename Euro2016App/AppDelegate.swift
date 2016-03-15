//
//  AppDelegate.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 25/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self
        
        
        Fabric.with([Twitter.self])

       
        
        
        
        let settings = UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
            FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
       


       UINavigationBar .appearance().setBackgroundImage(UIImage(named: "topbar-inner"),
            forBarMetrics: .Default)
        
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Quicksand-Regular", size: 16)!
        ]
        UINavigationBar .appearance().titleTextAttributes = attributes
                 IQKeyboardManager.sharedManager().enable = true
        
        let SaveDeviceParamDict:[String:AnyObject] = ["device_token":"8734ec79aaf8112757c1e59b8c66c31989b48f6c74336ae89cd179e063ab9749","device_type":"IOS"]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("8734ec79aaf8112757c1e59b8c66c31989b48f6c74336ae89cd179e063ab9749", forKey: "deviceToken")

        
        DataManager.API("saveDevice", jsonString: SaveDeviceParamDict, success: { (response) -> Void in
           
            if response.objectForKey("result") as? Bool == true {
                print(response.objectForKey("message"))
            }
            
         
        })

        // Override point for customization after application launch.
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        
        if (url.scheme == "fb1121606097851813") {
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        }
        else
        {
            return GIDSignIn.sharedInstance().handleURL(url,
                sourceApplication: sourceApplication,
                annotation: annotation)
            
          

        }
        
        
        
        
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
             
                // ...
            } else {
                print("\(error.localizedDescription)")
            }
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        //App activation code
        FBSDKAppEvents.activateApp()
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
       // let deviceTokenStr = convertDeviceTokenToString(deviceToken) ?? "8734ec79aaf8112757c1e59b8c66c31989b48f6c74336ae89cd179e063ab9749"
        
        
        // ...register device token with our Time Entry API server via REST
    }
    
     func convertDeviceTokenToString(deviceToken:NSData) -> String {
        //  Convert binary Device Token to a String (and remove the <,> and white space charaters).
        var deviceTokenStr = deviceToken.description.stringByReplacingOccurrencesOfString(">", withString: "")
        deviceTokenStr = deviceTokenStr.stringByReplacingOccurrencesOfString("<", withString: "")
        deviceTokenStr = deviceTokenStr.stringByReplacingOccurrencesOfString(" ", withString: "")
        deviceTokenStr = deviceTokenStr.uppercaseString
        return deviceTokenStr
    }
   

    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Device token for push notifications: FAIL -- ")
        print(error.description)
    }
    
   
      func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    }

