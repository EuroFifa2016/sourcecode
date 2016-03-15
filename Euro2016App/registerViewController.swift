//
//  registerViewController.swift
//  Euro2016App
//
//  Created by Amit Verma on 2/23/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class registerViewController: ActivityIndicatorViewController
{
    //MARK:Properties
    var gender:String = "Male"
    var isTermsClicked:Bool = false
    var isSignMeUpClicked:Bool = false
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:Actions
    
    @IBAction func registerButtonAction(sender: AnyObject) {
        
        let point = sender.convertPoint(CGPointZero, toView : self.tableView)
        let indexPath = self.tableView.indexPathForRowAtPoint(point)!
        let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        let emailTextField: UITextField = (cell.viewWithTag(101) as! UITextField)
        let firstNameTextField: UITextField = (cell.viewWithTag(102) as! UITextField)
        let lastNameTextField: UITextField = (cell.viewWithTag(103) as! UITextField)
        let dateOfBirthTextField: UITextField = (cell.viewWithTag(105) as! UITextField)
        let passwordTextField: UITextField = (cell.viewWithTag(108) as! UITextField)
        let confirmPasswordTextField: UITextField = (cell.viewWithTag(109) as! UITextField)
       // let termsConditionButton: UIButton = (cell.viewWithTag(111) as! UIButton)
        let countryOfResidence: UITextField = (cell.viewWithTag(104) as! UITextField)
        
        //-----Email validators-------//
        let emailRegEx: String = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        // ===== Empty Space Validators ======
        
        let trimmedEmailString = emailTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        let trimmedPasswordString = passwordTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        let trimmedfirstNameString = firstNameTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        let trimmedlastNameString = lastNameTextField.text!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        if emailTest.evaluateWithObject(trimmedEmailString) != true && trimmedEmailString.characters.count != 0 {
            
            
            let invalidEmailAlert = UIAlertController(title: "Euro2016", message: "Please enter valid email address.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            invalidEmailAlert.addAction(okAction)
            
            self.presentViewController(invalidEmailAlert, animated: true, completion: nil)
            
        }
        else if trimmedfirstNameString.characters.count == 0 {
            
            
            let emptyfirstNameAlert = UIAlertController(title: "Euro2016", message: "Please enter first name.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyfirstNameAlert.addAction(okAction)
            
            self.presentViewController(emptyfirstNameAlert, animated: true, completion: nil)
            
            
            
        }
        else if  trimmedfirstNameString.characters.count > 20 {
            
            let greaterThan20firstNameAlert = UIAlertController(title: "Euro2016", message: "First Name can't be greater than 20 letters.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            greaterThan20firstNameAlert.addAction(okAction)
            
            self.presentViewController(greaterThan20firstNameAlert, animated: true, completion: nil)
            
            
            
        }
        else if trimmedlastNameString.characters.count == 0 {
            
            
            
            let emptyLastNameAlert = UIAlertController(title: "Euro2016", message: "Please enter last name.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyLastNameAlert.addAction(okAction)
            
            self.presentViewController(emptyLastNameAlert, animated: true, completion: nil)
            
            
        }
            
        else if trimmedlastNameString.characters.count > 20 {
            
            
            let greaterThan20LastNameAlert = UIAlertController(title: "Euro2016", message: "Last Name can't be greater than 20 letters.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            greaterThan20LastNameAlert.addAction(okAction)
            
            self.presentViewController(greaterThan20LastNameAlert, animated: true, completion: nil)
            
            
            
        }
        else if countryOfResidence.text!.characters.count == 0
        {
            
            let emptyCountryAlert = UIAlertController(title: "Euro2016", message: "Please enter country of residence.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyCountryAlert.addAction(okAction)
            
            self.presentViewController(emptyCountryAlert, animated: true, completion: nil)
            
        }
        else if dateOfBirthTextField.text!.characters.count == 0 {
            
            
            let dateOfBirthAlert = UIAlertController(title: "Euro2016", message: "Please enter date of birth.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            dateOfBirthAlert.addAction(okAction)
            self.presentViewController(dateOfBirthAlert, animated: true, completion: nil)
            
        }
        else if trimmedPasswordString.characters.count == 0 {
            
            let emptyPasswordAlert = UIAlertController(title: "Euro2016", message: "Please enter password.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            emptyPasswordAlert.addAction(okAction)
            
            self.presentViewController(emptyPasswordAlert, animated: true, completion: nil)
            
            
        }
        else if trimmedPasswordString.characters.count < 6 {
            
            let lessThan6CharsPasswordAlert = UIAlertController(title: "Euro2016", message: "Password should contain at least 6 characters.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            lessThan6CharsPasswordAlert.addAction(okAction)
            
            self.presentViewController(lessThan6CharsPasswordAlert, animated: true, completion: nil)
            
            
        }
            
        else if !(trimmedPasswordString == confirmPasswordTextField.text) {
            
            let mismatchPasswordConfirmPasswordAlert = UIAlertController(title: "Euro2016", message: "Password and Confirm password do not match.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            mismatchPasswordConfirmPasswordAlert.addAction(okAction)
            
            self.presentViewController( mismatchPasswordConfirmPasswordAlert, animated: true, completion: nil)
            
        }
        else if isTermsClicked == false
        {
            
            let termsConditionAlert = UIAlertController(title: "Euro2016", message: "To register you have to agree to the Euro2016 Terms of Services and Privacy Policy.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            termsConditionAlert.addAction(okAction)
            
            self.presentViewController( termsConditionAlert, animated: true, completion: nil)
        }
        else
        {
//            let dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            let date = dateFormatter.dateFromString(dateOfBirthTextField.text!)
            
            
            
            let defaults = NSUserDefaults.standardUserDefaults()
            let deviceToken = defaults .valueForKey("deviceToken") as? String ?? ""
            
            let registerParamDict:[String:AnyObject] = ["first_name":trimmedfirstNameString,"last_name":trimmedlastNameString,"gender":gender,"email":trimmedEmailString,"date_of_birth":dateOfBirthTextField.text!,"country_name":countryOfResidence.text!,"device_token":deviceToken,"device_type":"IOS","newsletter":1,"password":trimmedPasswordString]
            super.progressBarDisplayer(
                true, view: self.view)
            print(registerParamDict)
                       
            DataManager.API("userRegistration", jsonString: registerParamDict, success:
                
                {
                    (response) -> Void in
                    
                    print(response)
                    if response.objectForKey("result") as? Bool == true
                    {
                        super.progressBarDisplayer( false, view: self.view)
                        
                        
                            
                            super.progressBarDisplayer( false, view: self.view)
                            let successAlert = UIAlertController(title: "Euro2016", message: "Thanks for registering on EuroCup.We have sent an activation link on your email Id.Please activate your account.", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            // Create the actions
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                                UIAlertAction in
                                self.navigationController?.popViewControllerAnimated(true)
                            }
                            successAlert.addAction(okAction)
                            self.presentViewController(successAlert, animated: true, completion: nil)
                        
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
    
    
    
    @IBAction func termsConditionsButtonAction(sender: AnyObject) {
        
        
       let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        let termsConditionsButton: UIButton = (cell.viewWithTag(111) as! UIButton)
        
        
        if isTermsClicked == false {
            termsConditionsButton.setImage(UIImage(named: "Image20"), forState: .Normal)
            isTermsClicked = true
        }
        else {
            termsConditionsButton.setImage(nil, forState: .Normal)
            isTermsClicked = false
        }
        
        
    }
    @IBAction func signMeUpButtonAction(sender: AnyObject) {
        
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        let signMeUpButton: UIButton = (cell.viewWithTag(110) as! UIButton)
        
        if isSignMeUpClicked == false {
            signMeUpButton.setImage(nil, forState: .Normal)
            isSignMeUpClicked = true
        }
        else {
            signMeUpButton.setImage(UIImage(named: "Image20"), forState: .Normal)
            isSignMeUpClicked = false
        }
        
        
    }
    @IBAction func genderBtnAction(sender: AnyObject) {
        
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        let maleButton: UIButton = (cell.viewWithTag(106) as! UIButton)
        let femaleButton: UIButton = (cell.viewWithTag(107) as! UIButton)
        
        if sender.tag == 106 {
            maleButton.setImage(UIImage(named: "Image21"), forState: .Normal)
            femaleButton.setImage(nil, forState: .Normal)
            gender = "male"
        }
        else {
            
            femaleButton.setImage(UIImage(named: "Image21"), forState: .Normal)
            maleButton.setImage(nil, forState: .Normal)
            gender = "female"
        }
        
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
       
         CustomButton.setBackBarButtonItem(self)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)as!RegisterTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        let  datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.date = NSDate()
        datePicker.maximumDate = NSDate()
        datePicker.datePickerMode = .Date
        datePicker.addTarget(self, action: "updateTextField:", forControlEvents: .ValueChanged)
        cell.dateOfBirthTextField.inputView = datePicker
        
        // Configure the cell...
        
        return cell
    }
    
    func updateTextField(sender: AnyObject)
    {
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        let dateOfBirthTextField: UITextField = (cell.viewWithTag(105) as! UITextField)
        
        let picker: UIDatePicker = (dateOfBirthTextField.inputView as! UIDatePicker)
        let dateFormat: NSDateFormatter = NSDateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let currentDate: String = dateFormat.stringFromDate(picker.date)
        dateOfBirthTextField.text = currentDate
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCountries" {
            
            self.view .endEditing(true)
            
        }
    }
    
    @IBAction func unwindToCountryList(sender: UIStoryboardSegue)
    {
        
        if let sourceViewController = sender.sourceViewController as? SelectCountryViewController, country = sourceViewController.country {
            
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            print(country)
            let cell: UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
            let countryOfResidenceTextField: UITextField = (cell.viewWithTag(104) as! UITextField)
            countryOfResidenceTextField.text = country
            
            
        }
        
        
    }
    
    
    
    
    
}
