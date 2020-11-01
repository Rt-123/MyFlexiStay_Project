//
//  NetworkManage.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 31/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkManagerGetOTP {

    // getCountry Call
    func GetConutyId(urlString:URL){
        AF.request(urlString).responseJSON { (response) in
            
            DataModel.MainDict = response.value as! NSDictionary
            DataModel.ArrData = DataModel.MainDict.value(forKey: "country") as! NSDictionary
            DataModel.country_Id = DataModel.ArrData.value(forKey: "id") as! Int
            print("Country Id\(DataModel.country_Id)")
        }
    }
    
   // Send OTP Call
    func SendOTPCall(){
        guard  let urlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/sendOtp")else{return}
         
        var urlRequest = URLRequest.init(url: urlString, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = "POST"
        var sendOtpParameter = ["country_id":1,"mobile": 9606349900]

       // urlRequest.httpBody = sendOtpParameter.data(using: .utf8)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: sendOtpParameter, options: []) else{return}
              urlRequest.httpBody = httpBody
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if  data != nil && error == nil{
                
                do{
              
                    let response = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                  print(response)
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                print("Data nil or error")
            }
        }.resume()

        
    }
    // ValideOTP Call
    func ValideOTPCall(){
        guard  let urlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/validateOtp")else{return}
         
        var urlRequest = URLRequest.init(url: urlString, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = "POST"
     var validatioOtpPara = [ "country_id": 1,"mobile": 9309924851,"otp": 174730]
       // urlRequest.httpBody = sendOtpParameter.data(using: .utf8)
       
       // urlRequest.httpBody = validatioOtpPara.percentEncoded()

        guard let httpBody = try? JSONSerialization.data(withJSONObject: validatioOtpPara, options: []) else{return}
        urlRequest.httpBody = httpBody
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if  data != nil && error == nil{
                
                do{
              
                    let responseDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                    print(responseDict)
                //    let countryId = response.value(forKey: "country_id") as! Int
                    //print(countryId)
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                print("Data nil or error")
            }
        }.resume()

        
    }
    // Get OTP Call
    func GetOTPCall(){
           guard  let urlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getOtpType")else{return}
            
           var urlRequest = URLRequest.init(url: urlString, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
          
        urlRequest.httpMethod = "POST"
        var GetOTPParameter = ["code":"MV"]

       guard let httpBody = try? JSONSerialization.data(withJSONObject: GetOTPParameter, options: []) else{return}
        urlRequest.httpBody = httpBody
           URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
               
               if  data != nil && error == nil{
                   
                   do{
                 
                       let response = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                       print(response)
                   }catch{
                       print(error.localizedDescription)
                   }
               }else{
                   print("Data nil or error")
               }
           }.resume()

           
       }
    func RegisterUserl(){
        guard  let urlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/validateOtp")else{return}
         
        var urlRequest = URLRequest.init(url: urlString, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = "POST"
        let registerUser = ["user_type_id": 4,"first_name": RegisterInputValue.firstName,"last_name": RegisterInputValue.lastName,"country_id": 1,"mobile": RegisterInputValue.mobileNumber,"email": "shankar.andanappa@gmail.com","password": "100000:711c845245d5563ba577d574993bc7be:7458b5e51b09a9d76fa3776999e010fe38e633fc732bd5c0e83b6ea1fb082a99f351d44162861bcd77cca40072f40d3c5421498ade9068ea0fe88b44e60d6e96"] as [String : Any]
       // urlRequest.httpBody = sendOtpParameter.data(using: .utf8)
       
       // urlRequest.httpBody = validatioOtpPara.percentEncoded()

        guard let httpBody = try? JSONSerialization.data(withJSONObject: registerUser, options: []) else{return}
        urlRequest.httpBody = httpBody
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if  data != nil && error == nil{
                
                do{
              
                    let responseDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                    print(responseDict)
                //    let countryId = response.value(forKey: "country_id") as! Int
                    //print(countryId)
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                print("Data nil or error")
            }
        }.resume()

        
    }
    
}




struct DataModel{

    // GetOTP
    static var MainDict:NSDictionary = NSDictionary()
    static var ArrData:NSDictionary = NSDictionary()
    static var otpLength = 0
    static var expirationTime = 0
    static var resendTime = 0
    
    //get Country
    static var country_Id:Int = 0
    
    static var getCountryUrl:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development//getCountry")!
    
    
    
    
    
    // Post URL
    static var urlGetOTP:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getOtpType")!
    static var sendOTPUrl:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/sendOtp")!
    static var validateOTPUrl:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/validateOtp")!
  
    static var GetOTPParameter = ["code": "MV"]
    static var sendOtpParameter = ["country_id":"1","mobile": "9606349900"]
}
struct RegisterInputValue {
    static var firstName = ""
    static  var lastName = ""
    static  var mobileNumber = ""
    static  var password = ""
    
}
