//
//  RegisterViewController.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 30/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var otpEnterTextfield: UITextField!
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var otpTimer: UILabel!
    @IBOutlet weak var sendOtp: UIButton!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var DesignView: UIView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var validtion: UILabel!
    
    var CommontextFields = [UITextField]()
    var count = 30
    var timer = Timer()
     var intanceGetOTPCall = NetworkManagerGetOTP()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        DesignView.layer.borderWidth = 2
        DesignView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DesignView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DesignView.layer.cornerRadius = 10
        
        otpTimer.isHidden = true
        sendOtp.isHidden = true
        validtion.isHidden = true
        Continue.layer.cornerRadius = 10
        Continue.clipsToBounds = true
        CommontextFields = [firstNameTextField, LastName,mobileTextField, otpEnterTextfield, PasswordTextField]
                        CommontextFields.forEach {
                            $0.delegate = self

                
                        }
        intanceGetOTPCall.GetOTPCall(urlString: DataModel.urlGetOTP)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
                   switch textField{
                   case mobileTextField:
                        otpTimer.isHidden = false
                        sendOtp.isHidden = false
                       mobileTextField.keyboardType = .numberPad
                       mobileTextField.enablesReturnKeyAutomatically = true
                   
                   default:
                       break
                   }
    }
    
    @IBAction func sendOTP(_ sender: UIButton) {

        otpTimer.isHidden = false
        print("click")
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        }

    @objc func countDown() {
        otpTimer.text = "\(count)"
        if count == 0 {
            sendOtp.setTitle("Resent OTP", for: .normal)
            timer.invalidate()
            count = 30

        }
        count -= 1

    }
  
}

extension RegisterViewController:UITextViewDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        if textField == firstNameTextField{
            LastName.becomeFirstResponder()
            
        }else if textField == LastName{
            mobileTextField.becomeFirstResponder()
        }else if textField == mobileTextField{
            otpEnterTextfield.becomeFirstResponder()
        }else if textField == otpEnterTextfield{
            PasswordTextField.becomeFirstResponder()
        }else{
            print("Password api call")
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        CommontextFields = [firstNameTextField, LastName,mobileTextField, otpEnterTextfield, PasswordTextField]
                CommontextFields.forEach {
                    $0.text = " "

        
                }
       
    }
}
