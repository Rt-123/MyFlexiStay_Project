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
    
    @IBOutlet weak var fiveView: UIView!
    @IBOutlet weak var frouthView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var seconVIew: UIView!
    
    var iconClick = true
    
    var CommontextFields = [UITextField]()
    
    
    var count = 30
    var timer = Timer()
    var intanceGetOTPCall = NetworkManagerGetOTP()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "passTogle"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 10, right: 0)
        button.frame = CGRect(x: CGFloat(PasswordTextField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(10), height: CGFloat(10))
        button.addTarget(self, action: #selector(iconAction(sender:)), for: .touchUpInside)
        PasswordTextField.rightView = button
        PasswordTextField.rightViewMode = .always
        
        
        DesignView.layer.borderWidth = 2
        DesignView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DesignView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        DesignView.layer.cornerRadius = 10
        
        otpTimer.isHidden = true
        sendOtp.isHidden = true
        validtion.isHidden = true
        Continue.layer.cornerRadius = 10
        Continue.clipsToBounds = true
        PasswordTextField.textContentType = .oneTimeCode
        //  let btn = UIButton()
        // btn.setImage(UIImage(named: "icons8-checkmark-64 (1)"), for: .normal)
        
        // self.PasswordTextField.setupRightImage(imageName: "\(self.view.addSubview(btn))" )
        // self.waterSuplyTxt.setupRightImage(imageName: "down-arrow (1)")
        CommontextFields = [firstNameTextField, LastName,mobileTextField, otpEnterTextfield, PasswordTextField]
        CommontextFields.forEach {
            $0.delegate = self
            
            
        }
        
        intanceGetOTPCall.GetConutyId(urlString: DataModel.getCountryUrl)
        //intanceGetOTPCall.SendOTPCallPost(urlString: DataModel.sendOTPUrl)
        //  intanceGetOTPCall.VaidationOTPCallPost(urlString: DataModel.validateOTPUrl)
        //  intanceGetOTPCall.GetOTPCallPost(urlString: DataModel.urlGetOTP)
        //  intanceGetOTPCall.withoutAlmoFire()
        //  intanceGetOTPCall.ValideOTPCall()
        //     intanceGetOTPCall.GetOTPCall()
        // intanceGetOTPCall.SendOTPCall()
        
    }
    
    @IBAction func contiueTORegiserUser(_ sender: UIButton) {
        
        if firstNameTextField.text != nil{
            RegisterInputValue.firstName = firstNameTextField.text!
        }else if LastName.text != nil{
            RegisterInputValue.lastName = LastName.text!
        }else if mobileTextField.text != nil{
            RegisterInputValue.mobileNumber = mobileTextField.text!
        }
        if firstNameTextField.text != nil && LastName.text != nil &&  (mobileTextField.text != nil){
            intanceGetOTPCall.RegisterUserl()
            firstView.layer.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            
            seconVIew.layer.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            thirdView.layer.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            frouthView.layer.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            fiveView.layer.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
    }
    @IBAction func iconAction(sender: UIButton) {
        if( iconClick == true) {
            PasswordTextField.isSecureTextEntry = true
        } else {
            PasswordTextField.isSecureTextEntry = false
        }
        
        iconClick = !iconClick
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //        if mobileTextField.text?.isEmpty !== true {
        //
        //        }
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
            sendOtp.isHidden = true
            
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
