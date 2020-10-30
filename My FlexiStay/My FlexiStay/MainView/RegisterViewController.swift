//
//  RegisterViewController.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 30/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var otpTimer: UILabel!
    @IBOutlet weak var sendOtp: UIButton!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var DesignView: UIView!
    @IBOutlet weak var topImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DesignView.layer.borderWidth = 1
        DesignView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        DesignView.layer.cornerRadius = 10
        
        Continue.layer.cornerRadius = 20
        Continue.clipsToBounds = true
    }
    

    @IBAction func sendOTP(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
