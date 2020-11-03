//
//  NetworkManager.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 29/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
class NetworkManagerAminities{
    
    weak var vc:Amenities?
    
    func  CallGetAPI(urlstring:URL) -> NSArray{
              
        
        URLSession.shared.dataTask(with: urlstring) { (data, response, err) in
                  
                  if data != nil && err == nil{
                      do{
                          AminitiesDataModel.AminitiesMainDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                        AminitiesDataModel.AminitiesDataArr = AminitiesDataModel.AminitiesMainDict.value(forKey: "amenities") as! [NSDictionary]
                          AminitiesDataModel.AminitiesDataArr.forEach { (element) in
//
                            AminitiesDataModel.NewArrDataForAminities.append(element.value(forKey: "name") as! String)
                            AminitiesDataModel.imgUrlData.append(element.value(forKey: "icon_url") as! String)
                            DispatchQueue.main.async {
                                self.vc?.collectonRef.reloadData()
                            }
                           
                          }
                     
                        print(AminitiesDataModel.NewArrDataForAminities)
                      }catch{
                          print(err?.localizedDescription)
                      }
                  }
              }.resume()
        
        return AminitiesDataModel.NewArrDataForAminities as NSArray
          }
    func  AminitiesWaterSuply(urlstring:URL) -> NSArray{
                  
            
            URLSession.shared.dataTask(with: urlstring) { (data, response, err) in
                      
                      if data != nil && err == nil{
                          do{
                           
                            let MainDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                            let newDataArr = MainDict.value(forKey: "types") as! [NSDictionary]
                              newDataArr.forEach { (element) in
    //
                                var newArrForName = [String]()
                                aminitiesWaterSuply.newArrForName.append(element.value(forKey: "name") as! String)
                               
                              }
                            print(aminitiesWaterSuply.newArrForName)
                          
                          }catch{
                              print(err?.localizedDescription)
                          }
                      }
                  }.resume()
            
            return AminitiesDataModel.NewArrDataForAminities as NSArray
              }
}

struct aminitiesWaterSuply {
   static var newArrForName = [String]()
}
