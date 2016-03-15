//
//  ForgotPasswordViewController.swift
//  Euro2016App
//
//  Created by Amit Verma on 2/24/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: ActivityIndicatorViewController {
    
    //Mark:Properties
    
    @IBOutlet weak var forgotPasswordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    //Mark:Actions
    @IBAction func submitButtonAction(sender: AnyObject)
    {
        //-----Email validators-------//
        let emailRegEx: String = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        let trimmedEmailString = self.emailTextField.text!.stringByTrimmingCharactersInSet(
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
        else
        {
            let forgotPasswordParamDict:[String:AnyObject] = ["email":trimmedEmailString]
            super.progressBarDisplayer(
                true, view: self.view)
            
            DataManager.API("userLogin", jsonString: forgotPasswordParamDict, success:
                
                {
                    (response) -> Void in
                    
                    
                    if response.objectForKey("result") as? Bool == true
                    {
                        super.progressBarDisplayer( false, view: self.view)
                        let responseAlert = UIAlertController(title: "Euro2016", message: response.objectForKey("message") as? String, preferredStyle: UIAlertControllerStyle.Alert)
                        
                        // Create the actions
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                            UIAlertAction in
                            NSLog("OK Pressed")
                        }
                        responseAlert.addAction(okAction)
                        
                        self.presentViewController(responseAlert, animated: true, completion: nil)

                    }
                    else
                    {
                        super.progressBarDisplayer(false, view: self.view)
                        print("error")
                    }
                    
                    
            })
            

        }

        

    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "FORGOT PASSWORD?"
        CustomButton.setBackBarButtonItem(self)
        //=========
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.emailTextField.frame.height))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = UITextFieldViewMode.Always
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Enter Email Id",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        emailTextField.layer.borderColor = UIColor.grayColor().CGColor;
        emailTextField.layer.borderWidth = 1;
        emailTextField.layer.cornerRadius = 3;
        emailTextField.layer.masksToBounds = true
        
        //=======
        forgotPasswordView.layer.borderColor = UIColor.grayColor().CGColor;
        forgotPasswordView.layer.borderWidth = 1;
        forgotPasswordView.layer.cornerRadius = 3;
        forgotPasswordView.layer.masksToBounds = true
        self.navigationController?.navigationBarHidden = false

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
