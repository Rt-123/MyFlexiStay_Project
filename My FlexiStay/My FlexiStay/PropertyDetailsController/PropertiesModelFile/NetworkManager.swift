//
//  NetworkingFile.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 23/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
class NetworkManager{
    func  CallGetAPI(urlstring:URL) -> NSArray{
              
        
        URLSession.shared.dataTask(with: urlstring) { (data, response, err) in
                  
                  if data != nil && err == nil{
                      do{
                          PropertyDetailsDataModel.properTypeName = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                          PropertyDetailsDataModel.DataArr = PropertyDetailsDataModel.properTypeName.value(forKey: "types") as! [NSDictionary]
                          PropertyDetailsDataModel.DataArr.forEach { (element) in
                             print(element)
//
                            PropertyDetailsDataModel.NewArrData.append(element.value(forKey: "name") as! String)
                           
                          }
                     
                        print(PropertyDetailsDataModel.NewArrData)
                      }catch{
                          print(err?.localizedDescription)
                      }
                  }
              }.resume()
        
        return PropertyDetailsDataModel.NewArrData as NSArray
          }
}
