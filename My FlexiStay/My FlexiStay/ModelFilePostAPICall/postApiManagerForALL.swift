//
//  postApiManagerForALL.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 02/11/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation

class postAPIManager{
    func allPostAPICall(urlString:URL,parameters:[String:Any]){
        guard  let urlString:URL = urlString else{return}
                
               var urlRequest = URLRequest.init(url: urlString, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
               urlRequest.httpMethod = "POST"
            

              // urlRequest.httpBody = sendOtpParameter.data(using: .utf8)
        guard let httpBody = try? JSONSerialization.data(withJSONObject:parameters, options: []) else{return}
                     urlRequest.httpBody = httpBody
               URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                   
                   if  data != nil && error == nil{
                       
                       do{
                     
                           let MainDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                            
                            print(MainDict)
                       
                             
                       }catch{
                           print(error.localizedDescription)
                       }
                   }else{
                       print("Data nil or error")
                   }
               }.resume()
        
    }
    
}
