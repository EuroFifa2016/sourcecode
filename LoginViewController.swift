//
//  LoginViewController.swift
//  Euro2016App
//
//  Created by Khushboo Kochhar on 29/01/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit


class LoginViewController: ActivityIndicatorViewController,SSASideMenuDelegate,GIDSignInDelegate, GIDSignInUIDelegate{
    
    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailPasswordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    // MARK:Actions
    @IBAction func googleButtonAction(sender: AnyObject)
    {
        super.progressBarDisplayer( false, view: self.view)
        let signIn = GIDSignIn.sharedInstance()
        signIn.delegate = self
        signIn.uiDelegate = self
        signIn.signIn()
        
    }
    @IBAction func twitterButtonAction(sender: AnyObject) {
        
        super.progressBarDisplayer( true, view: self.view)
        
        
        
        Twitter.sharedInstance().logInWithCompletion
            {
                session, error in
                
                
                if (session != nil)
                {
                    
                    self.getUserTimeline((session?.userID)!)
                    
                }
                else
                {
                    super.progressBarDisplayer( false, view: self.view)
                    print("error: \(error!.localizedDescription)");
                }
        }
        
        
    }
    
    
    
    
    
    
    @IBAction func facebookBtnAction(sender: AnyObject) {
        
        let facebookReadPermissions = ["public_profile", "email","user_location"]
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        super.progressBarDisplayer( true, view: self.view)
        
        fbLoginManager.logInWithReadPermissions(facebookReadPermissions, handler: { (result, error) -> Void in
            
            if (error == nil)
            {
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                self.returnUserData()
            }
            else
            {
                print(error)
                super.progressBarDisplayer( false, view: self.view)
            }
        })
        
        
    }
    
    func returnUserData()
    {
        if((FBSDKAccessToken.currentAccessToken()) != nil)
        {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,name,gender, first_name,last_name, picture, email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil)
                {
                    
                    
                    let defaults = NSUserDefaults.standardUserDefaults()
                    let deviceToken = defaults .valueForKey("deviceToken") as? String ?? ""
                    
                    
                    let FacebookParamDict:[String:AnyObject] = ["first_name":result.valueForKey("first_name") as! String,"last_name":result.valueForKey("last_name") as! String,"gender":result.valueForKey("gender") as! String, "facebookId":result.valueForKey("id") as! String,"email":result.valueForKey("email") ?? "","device_token":deviceToken,"device_type":"IOS","profile_image":result.valueForKey("picture")!.valueForKey("data")! .valueForKey("url") as! String]
                    
                    
                    DataManager.API("facebookLogin", jsonString: FacebookParamDict, success: { (response) -> Void in
                        print (response)
                        super.progressBarDisplayer( false, view: self.view)
                        if response.objectForKey("result") as? Bool == true
                        {
                            
                            self.loginPushViewController()
                            
//                            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
//                            
//                            self.navigationController?.pushViewController(viewController, animated: true)
                        }
                    })
                    
                    
                }
                else
                {
                    super.progressBarDisplayer( false, view: self.view)
                }
            })
        }
        else
        {
            super.progressBarDisplayer( false, view: self.view)
            
        }
    }
    
    func loginPushViewController()
    {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        
        //-----Email validators-------//
        let emailRegEx: String = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        
        let trimmedEmailString = self.emailTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        let trimmedPasswordString = self.passwordTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        
        
        if trimmedEmailString.characters.count == 0 {
            let emptyEmailAlert = UIAlertController(title: "Euro2016", message: "Please enter email.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyEmailAlert.addAction(okAction)
            self.presentViewController( emptyEmailAlert, animated: true, completion: nil)
            
            
        }
        else if trimmedPasswordString.characters.count == 0 {
            
            
            let emptyPasswordAlert = UIAlertController(title: "Euro2016", message: "Please enter password.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyPasswordAlert.addAction(okAction)
            
            self.presentViewController( emptyPasswordAlert, animated: true, completion: nil)
            
        }
        else if  (emailTest.evaluateWithObject(trimmedEmailString) != true && trimmedEmailString.characters.count != 0) {
            let invalidEmailAlert = UIAlertController(title: "Euro2016", message: "Please enter valid email.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            invalidEmailAlert.addAction(okAction)
            
            self.presentViewController(invalidEmailAlert, animated: true, completion: nil)
        }
        else if  (trimmedPasswordString.characters.count<6) {
            let shortPasswordAlert = UIAlertController(title: "Euro2016", message: "Please enter minimum 6 characters for password.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            shortPasswordAlert.addAction(okAction)
            
            self.presentViewController(shortPasswordAlert, animated: true, completion: nil)
        }
        else
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            let deviceToken = defaults .valueForKey("deviceToken") as? String ?? ""
            
            let loginParamDict:[String:AnyObject] = ["email":trimmedEmailString,"password":trimmedPasswordString,"device_token":deviceToken,"device_type":"IOS"]
            super.progressBarDisplayer( true, view: self.view)
            
            DataManager.API("userLogin", jsonString: loginParamDict, success:
                
                {
                    (response) -> Void in
                    
                    
                    if response.objectForKey("result") as? Bool == true
                    {
                        super.progressBarDisplayer( false, view: self.view)
                        self.loginPushViewController()

                        //                        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
//                        
//                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                    else
                    {
                        super.progressBarDisplayer( false, view: self.view)
                        
                        let errorAlert = UIAlertController(title: "Euro2016", message: response.objectForKey("message") as? String, preferredStyle: UIAlertControllerStyle.Alert)
                        
                        // Create the actions
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                            UIAlertAction in
                            NSLog("OK Pressed")
                        }
                        errorAlert.addAction(okAction)
                        
                        self.presentViewController(errorAlert, animated: true, completion: nil)
                        
                        print("error")
                    }
                    
                    
            })
            
            
            
        }
        
        
    }
    
    @IBAction func forgotPasswordAction(sender: AnyObject) {
        
    }
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        
        // Setting Boundary Color and Corner Radius of Email Password View
        emailPasswordView.layer.cornerRadius = 3
        emailPasswordView.layer.borderColor = UIColor .grayColor().CGColor
        emailPasswordView.layer.borderWidth = 1.0
        emailPasswordView.layer.masksToBounds = true
        
        // Customising Placeholder of Email and Password Text Field
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
       override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "main_bg")!)
        
    }
    
    //===========
    func getUserTimeline(userId: String)
        
    {
        Twitter.sharedInstance().APIClient.loadUserWithID (userId, completion: {
            (user, error) in
            
            if (user != nil)
            {
                let defaults = NSUserDefaults.standardUserDefaults()
                let deviceToken = defaults .valueForKey("deviceToken") as? String ?? ""
                
                
                let twitterParamDict:[String:AnyObject] = ["full_name":(user?.name)!,"twitterId":(user?.userID)!,"device_token":deviceToken,"device_type":"IOS","profile_image":(user?.profileImageMiniURL)!]
                
                DataManager.API("twitterLogin", jsonString: twitterParamDict, success:
                    
                    {
                        (response) -> Void in
                        
                        
                        if response.objectForKey("result") as? Bool == true
                        {
                            super.progressBarDisplayer( false, view: self.view)
                            self.loginPushViewController()

                            //                            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
//                            
//                           self.navigationController?.pushViewController(viewController, animated: true)
                        }
                        else
                        {
                            super.progressBarDisplayer( false, view: self.view)
                            print("error")
                        }
                        
                        
                })
                
                
            }
            else
            {
                super.progressBarDisplayer( false, view: self.view)
                print("error")
            }
        })
        
        
    }
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                
                
                // Perform any operations on signed in user here.
                let userId = user.userID                  // For client-side use only!
                let name = user.profile.name
                let email = user.profile.email
                // let url = user.profile.imageURLWithDimension(0.1)
                
                let defaults = NSUserDefaults.standardUserDefaults()
                let deviceToken = defaults .valueForKey("deviceToken") as? String ?? ""
                
                let GoogleParamDict:[String:AnyObject] = ["name":name, "googleId":userId,"email":email,"device_token":deviceToken,"device_type":"IOS"]
                print(GoogleParamDict)
                
                DataManager.API("googleLogin", jsonString: GoogleParamDict, success: { (response) -> Void in
                    print (response)
                    super.progressBarDisplayer( false, view: self.view)
                    if response.objectForKey("result") as? Bool == true
                    {
                        self.loginPushViewController()

                        
//                        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SSASideMenu") as! SSASideMenu
//                        
//                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                    else
                    {
                        print(error)
                    }
                })
                
                // ...
            } else {
                print("\(error.localizedDescription)")
                super.progressBarDisplayer( false, view: self.view)
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

