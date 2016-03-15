//
//  RegisterTableViewCell.swift
//  Euro2016App
//
//  Created by Amit Verma on 2/23/16.
//  Copyright © 2016 TrigmaSolutionsPvtLtd. All rights reserved.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var registerUpperView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var countryOfResidenceTextField: UITextField!
    @IBOutlet weak var termsConditionButton: UIButton!
    @IBOutlet weak var signMeUpButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var registerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        signMeUpButton .setImage(UIImage(named:"Image20"), forState: .Normal)
         maleButton .setImage(UIImage(named:"Image21"), forState: .Normal)
        
        
        
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(string:"First Name",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        lastNameTextField.attributedPlaceholder = NSAttributedString(string:"Last Name",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        dateOfBirthTextField.attributedPlaceholder = NSAttributedString(string:"Date of Birth",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string:"Confirm Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        countryOfResidenceTextField.attributedPlaceholder = NSAttributedString(string:"Country of residence",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
       
        registerUpperView.layer.borderColor = UIColor.grayColor().CGColor;
        registerUpperView.layer.borderWidth = 1;
        registerUpperView.layer.cornerRadius = 3;
        registerUpperView.layer.masksToBounds = true

        
        maleButton.layer.cornerRadius = 10
        maleButton.layer.borderColor = UIColor .grayColor().CGColor
        maleButton.layer.borderWidth = 1.0
        maleButton.layer.masksToBounds = true
        
        
        femaleButton.layer.cornerRadius = 10
        femaleButton.layer.borderColor = UIColor .grayColor().CGColor
        femaleButton.layer.borderWidth = 1.0
        femaleButton.layer.masksToBounds = true
        
        signMeUpButton.layer.cornerRadius = 2
        signMeUpButton.layer.borderColor = UIColor .grayColor().CGColor
        signMeUpButton.layer.borderWidth = 1.0
        signMeUpButton.layer.masksToBounds = true
        
        termsConditionButton.layer.cornerRadius = 2
        termsConditionButton.layer.borderColor = UIColor .grayColor().CGColor
        termsConditionButton.layer.borderWidth = 1.0
        termsConditionButton.layer.masksToBounds = true
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
