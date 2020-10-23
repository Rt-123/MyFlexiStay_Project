//
//  Register_Page2.swift
//  My FlexiStay
//
//  Created by Apple on 08/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit
import Alamofire

class Register_Page2: UIViewController {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var contbtn1: UIButton!
    
    let apiurl = "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development"
    
    func login() {
           let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/login")
                                           
            var dict : [String:Any] = ["country_id": 1,
                                        "mobile": 9844675900,
  "password":"100000:711c845245d5563ba577d574993bc7be:7458b5e51b09a9d76fa3776999e010fe38e633fc732bd5c0e83b6ea1fb082a99f351d44162861bcd77cca40072f40d3c5421498ade9068ea0fe88b44e60d6e96"]
                                      
        let session = URLSession.shared
        var request = URLRequest(url: url1!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try?
    JSONSerialization.data(withJSONObject: dict, options: [])
    session.dataTask(with: request) { (read, response, error) in
        if let data = read{
        do{
        guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
        dict = jsonResponse as! [String:Any]
            DispatchQueue.main.async {
                print(jsonResponse)
            }
        }catch{
            print(error.localizedDescription)
            }
           }
         }.resume()
       }
    func getSalt() {
        let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getSalt")
        var dict : [String:Any] = ["country_id": 1,
                                        "mobile": 9844675900]
        let session = URLSession.shared
        var request = URLRequest(url: url1!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try?
        JSONSerialization.data(withJSONObject: dict, options: [])
            session.dataTask(with: request) { (read, response, error) in
            if let data = read{
            do{
        guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
            dict = jsonResponse as! [String:Any]
//                                self.comp!(dict)
            DispatchQueue.main.async {
            print(jsonResponse)
            }
        }catch{
            print(error.localizedDescription)
            }
          }
        }.resume()
        }
    
    func validateotp(){
        let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/validateOtp")
        var dict : [String:Any] = ["country_id": 1,
                                   "mobile": 9606349900,
                                    "otp": 174730]
        let session = URLSession.shared
        var request = URLRequest(url: url1!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try?
        JSONSerialization.data(withJSONObject: dict, options: [])
        session.dataTask(with: request) { (read, response, error) in
        if let data = read{
        do{
        guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
            dict = jsonResponse as! [String:Any]
            DispatchQueue.main.async {
        print(jsonResponse)
        }
    }catch{
            print(error.localizedDescription)
        }
    }
        }.resume()
     }
    func getProfile(){

    let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getProfile")
    var dict : [String:Any] = [
              "token": "gmxguQrLozCrAZ45tSD0vAce2eK7OQc6Q11k1LG1QVnzeUo4syOflqU9ocr48Nix"]
            let session = URLSession.shared
            var request = URLRequest(url: url1!)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = try?
            JSONSerialization.data(withJSONObject: dict, options: [])
            session.dataTask(with: request) { (read, response, error) in
            if let data = read{
            do{
        guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
        dict = jsonResponse as! [String:Any]
        DispatchQueue.main.async {
        print(jsonResponse)
        }
    }catch{
    print(error.localizedDescription)
     }
    }
        }.resume()
    }
    func sendOtp() {
            let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/sendOtp")
        var dict : [String:Any] = ["country_id": 1,
                                "mobile": 9606349900]
            
                let session = URLSession.shared
                var request = URLRequest(url: url1!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
                request.httpMethod = "POST"
                request.httpBody = try?
            
        JSONSerialization.data(withJSONObject: dict, options: [])
        session.dataTask(with: request) { (read, response, error) in
            
        if let data = read
        {
        do
        {
        guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
            
            dict = jsonResponse as! [String:Any]
//                            self.comp!(dict)
            DispatchQueue.main.async {
            print(jsonResponse)
            }
    }
        catch
            {
        print(error.localizedDescription)
        }
       }
        }.resume()
        }
        
        func registerUser() {
        let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/registerUser")
            
        var dict : [String:Any] = ["user_type_id": 4,
                              "first_name": "Shankar",
                              "last_name": "Andanappa",
                              "country_id": 1,
                              "mobile": 9844675900,
                              "email": "shankar.andanappa@gmail.com",
                              "password": "100000:711c845245d5563ba577d574993bc7be:7458b5e51b09a9d76fa3776999e010fe38e633fc732bd5c0e83b6ea1fb082a99f351d44162861bcd77cca40072f40d3c5421498ade9068ea0fe88b44e60d6e96"]
            let session = URLSession.shared
            var request = URLRequest(url: url1!)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
                request.httpMethod = "POST"
                request.httpBody = try?
            
            JSONSerialization.data(withJSONObject: dict, options: [])
            session.dataTask(with: request) { (read, response, error) in
            
            if let data = read
            {
            do
            {
            guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
            
                dict = jsonResponse as! [String:Any]
//                                self.comp!(dict)
                DispatchQueue.main.async {
                print(jsonResponse)
                }
    }
            catch
                {
                print(error.localizedDescription)
                }
             }
            }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Textdata()
        login()
        getSalt()
        getProfile()
        validateotp()
        registerUser()
        sendOtp()
        
        
    }
    @IBAction func contnbtn1(_ sender: UIButton!){
        txt1.text = ""
        txt2.text = ""
        txt3.text = ""
        txt4.text = ""
        txt5.text = ""
    }
    

}
        
extension UITextField {

    func setBottomBorder() {
      //  self.layer.shadowColor = UIColor.gre.cgColor;
        self.layer.shadowColor = UIColor.green.cgColor;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

func Textdata() {
    
}

