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
    func GetOTPCall(urlString:URL){
        AF.request(urlString).responseJSON { (response) in
            
            DataModel.MainDict = response.value as! NSDictionary
            DataModel.ArrData = DataModel.MainDict.value(forKey: "otp_type") as! NSDictionary
            DataModel.otpLength = DataModel.ArrData.value(forKey: "length") as! Int
            DataModel.expirationTime = DataModel.ArrData.value(forKey: "expiration") as! Int
            DataModel.resendTime = DataModel.ArrData.value(forKey: "resend_interval") as! Int
//            print("\(DataModel.ArrData)")
//            print(DataModel.MainDict)
            print("length = \(DataModel.otpLength)")
            print("expiration = \(DataModel.expirationTime)")
            print("resend_interval = \(DataModel.resendTime)")
        }
    }
}
struct DataModel{
    static var MainDict:NSDictionary = NSDictionary()
    static var ArrData:NSDictionary = NSDictionary()
    static var otpLength = 0
    static var expirationTime = 0
    static var resendTime = 0
    static var urlGetOTP:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development//getOtpType")!
    
}
