//
//  NetworkingFile.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 23/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
class NetworkManager{
    func  BHKTypeName(urlstring:URL) -> NSArray{
              
        
        URLSession.shared.dataTask(with: urlstring) { (data, response, err) in
                  
                  if data != nil && err == nil{
                      do{
                          ALLDataModel.properTypeName = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                          ALLDataModel.DataArr = ALLDataModel.properTypeName.value(forKey: "types") as! [NSDictionary]
                          ALLDataModel.DataArr.forEach { (element) in
                             print(element)
//
                            ALLDataModel.NewArrData.append(element["name"] as! String)
                           
                          }
                     
                        print(ALLDataModel.NewArrData)
                      }catch{
                          print(err?.localizedDescription)
                      }
                  }
              }.resume()
        
        return ALLDataModel.NewArrData as NSArray
          }
}
