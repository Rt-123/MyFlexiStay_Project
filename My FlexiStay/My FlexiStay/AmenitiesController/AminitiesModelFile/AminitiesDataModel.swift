//
//  DataModel.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 29/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
import UIKit
struct  AminitiesDataModel {
    static var AminitiesMainDict:NSDictionary = NSDictionary()
    static var AminitiesDataArr:[NSDictionary] = [NSDictionary]()
    static var AminitiesName:String = ""
   
    static var NewArrDataForAminities = [String]()
    static var imgUrlData = [String]()
    static var waterSuply = ""
  static  let AminitiesUrlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getAmenities")!
    static  let aminitiesWaterSuplyLink:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getWaterSupplyType")!

   // gaurd let AminitiesUrlString:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development//getAmenities")else{return}
}
