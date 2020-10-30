//
//  Register Page.swift
//  My FlexiStay
//
//  Created by Apple on 05/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit
import Alamofire

class Register_Page: UIViewController {

    
    @IBOutlet weak var otpTxt4: UITextField!
    @IBOutlet weak var otpTxt3: UITextField!
    @IBOutlet weak var otpTxt2: UITextField!
    @IBOutlet weak var otpTxt1: UITextField!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var arroimage: UIImageView!
    
    @IBOutlet weak var enterMobileNumber: UITextField!
    
    @IBOutlet weak var contLbl: UILabel!
    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet var registerview: UIView!
    @IBOutlet weak var regiimg: UIImageView!
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var viewss23: UIView!
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var ResentOTP: UIButton!
    var pnamearray : [String] = []
    
    var regimg1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    var demoimg = "https://myflexistay-dev-images.s3.ap-south-1.amazonaws.com/Images-13.jpg"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterMobileNumber.layer.cornerRadius = 10
        enterMobileNumber.textContentType = .oneTimeCode
        enterMobileNumber.keyboardType = .numberPad
       // contLbl.backgroundColor = UIColor(red: 15/255, green: 27/255, blue: 76/255, alpha: 1)
        registerview.backgroundColor = UIColor(red: 15/255, green: 27/255, blue: 76/255, alpha: 1)
        Textdata()
        topImage.main(urlstring: demoimg)
        arroimage.main(urlstring: regimg1)
        continuebtn.layer.cornerRadius = 10
        viewss23.layer.cornerRadius = 20
        viewss23.clipsToBounds = true
        

    }
    
    
    @IBAction func `continue`(_ sender: UIButton) {
    }
    
//    func registerService(){
//
////        print("register tapped")
//
//        let parameters : [String : Any] = ["country_id": 1,
//                                               "mobile": "9844675900",
//         "password":"100000:711c845245d5563ba577d574993bc7be:7458b5e51b09a9d76fa3776999e010fe38e633fc732bd5c0e83b6ea1fb082a99f351d44162861bcd77cca40072f40d3c5421498ade9068ea0fe88b44e60d6e96"]
//
//        let url = URL(string: "https://myflexistay-dev-images.s3.ap-south-1.amazonaws.com/Images-13.jpg")
//        var req =  URLRequest(url: url!)
//        req.httpMethod = "POST"
//        req.addValue("application/json", forHTTPHeaderField: "Contet-Type")
//        req.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
//        req.httpBody = httpBody
//        let session = URLSession.shared
//        session.dataTask(with: req, completionHandler: {(data, response, error) in
//            if response != nil {
//                // print(response)
//            }
//            if let data = data {
//                do{
//        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
//                let phNum = json["mobile"] as? Int
//                let txt9 = json["country_id"] as? Int
//                DispatchQueue.main.async {
//                //self.txt6.text = self.txt7 as? String
//                    }
//                }catch{
//                    print("error")
//                }
//            }
//        }).resume()
//    }
//    func Validateotp() {
//         let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/login")
//
//        var dict : [String:Any] = ["country_id": 1,
//                                "mobile": "9844675900",
//    "password":"100000:711c845245d5563ba577d574993bc7be:7458b5e51b09a9d76fa3776999e010fe38e633fc732bd5c0e83b6ea1fb082a99f351d44162861bcd77cca40072f40d3c5421498ade9068ea0fe88b44e60d6e96"]
//
//          let session = URLSession.shared
//          var request = URLRequest(url: url1!)
//          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//          request.httpMethod = "POST"
//        request.httpBody = try?
//      JSONSerialization.data(withJSONObject: dict, options: [])
//      session.dataTask(with: request) { (read, response, error) in
//
////          if let data = read {
////          do{
////          guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
////            if response != nil{
////
////            }
//            if let data = data {
//                do{
//            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
//            let mobileNum = json["mobile"] as? [String : Any]
//            let Uid = mobileNum["country_id"] as? Int
//            let name = mobileNum["password"] as? [String : Any]
//                }
//            }
//          dict = jsonResponse as! [String:Any]
//              DispatchQueue.main.async {
//                  print(jsonResponse)
//              }
//          }catch{
////              print(error.localizedDescription)
////              }
////             }
//           }.resume()
//         }


    @IBAction func ResntOtpClick(_ sender: UIButton) {
    }
    
//    func otpService(){

////        let parameters = ["mobile_number": phoneNumTextField.text as Any,
////                          "otp": otpTextField.text as Any]
//
//        let url = URL(string: "https://webservices//otpverify")
//        var req =  URLRequest(url: url!)
//        req.httpMethod = "POST"
//        req.addValue("application/json", forHTTPHeaderField: "Contet-Type")
//        req.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
//        req.httpBody = httpBody
//        let session = URLSession.shared
//        session.dataTask(with: req, completionHandler: {(data, response, error) in
//            if response != nil {
//                // print(response)
//            }
//            if let data = data {
//
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
//                    let mobileNum = json["mobile_number"] as! [String : Any]
//
//                    let Uid = mobileNum["id"] as? String
//                    let name = mobileNum["name"] as? String
//                    let phNum = mobileNum["username"] as? String

//                    DispatchQueue.main.async {
//                        if (self.txt6?.text == String(self.otpField!)){
//                            print("registration successfullllll...")
////
//                            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                            self.present(loginVC, animated: true)
//                        }
//                        else{
//                            print("register fail")
//                        }
//                    }
//                }catch{
//                    print("error")
//                }
//            }
//        }).resume()
//    @objc func textFieldDidChange(textField: UITextField){
//           let text = textField.text
//           if  text?.count == 1 {
//               switch textField{
//
//               case txtf:
//                   txt6.becomeFirstResponder()
//               case txt6:
//                   txt7.becomeFirstResponder()
//               case txt8:
//                   txt9.becomeFirstResponder()
//               case txt9:
//                   txtf.becomeFirstResponder()
////               case txtFifth:
////                   txtFifth.resignFirstResponder()
////                   self.dismissKeyboard()
//               default:
//                   break
//               }
//           }
//           if  text?.count == 0 {
//               switch textField{
//               case txtf:
//                   txt6.becomeFirstResponder()
//               case txt6:
//                   txt7.becomeFirstResponder()
//               case txt7:
//                   txt8.becomeFirstResponder()
//               case txt9:
//                   txt9.becomeFirstResponder()
////               case txtFifth:
////                   txtForth.becomeFirstResponder()
//               default:
//                   break
//               }
//           }
//           else{
//
//           }
//       }
//
//    @IBAction func btn(_ sender: UIButton) {
//
//    }
//
//    @IBAction func txtfbtn2(_ sender: UITextField) {
//        txtf.text = ""
//    }
//
//}
//
}
extension UIImageView {
    func main(urlstring : String) {
        guard let url = URL(string: urlstring)else {
            return
        }
        DispatchQueue.global().async { [weak self] in

            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
