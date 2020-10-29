//
//  APILinkModel.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 23/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
struct ApiURL{
   static let propertyDetailsLink:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getPropertyTypes")!
    static let BHKUrlLink:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getAllBHKTypes")!
    static let PropertyAgeType:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getPropertyAgeTypes")!
    static let availabilityTypeLink:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development//getAvailabilityTypes")!


   
}

