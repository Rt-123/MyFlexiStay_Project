//
//  DataModelForPostAPI.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 02/11/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation


struct postAPILinks{
    
    static var createUpadatePropertyDetailsLik:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/createOrUpdatePropertyDetails")!
    static var createUpadateLocalityLnik:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/createOrUpdateLocalityDetails")!
   static var createUpadatescheduleLnik:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/createOrUpdateLocalityDetails")!
    static var aminitiesPostLnik:URL = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/addAmenity")!


}
struct PostAPIParameters {
   static let creatUpdateParameter = [ "s_token": "RC4CWvgitxUSPrP1cSoqJoj4YEqiek6l98qPrglU1DtEc2n3GDdG6paEIeGXsbPs",
    "apartment_name": "Laburnum",
    "bhk_type_id": 2,
    "sharing_type_id": 1,
    "built_up_area": 1700,
    "carpet_area": 1200,
    "facing_type_id": 1,
    "floor": 1,
    "listing_id": 1,
    "number_of_balconies": 2,
    "number_of_bathrooms": 2,
    "prefer_only_vegetarians": "false",
    "water_supply_type_id": 1,
    "property_age_type_id": 1,
    "property_type_id": 1,
    "total_floor": 2] as [String : Any]
    
    
static var createUpdateLocalityParameter = ["listing_id": 1,
"city_id": 1,
"locality_id": 1,
"pincode_id": 1,
"address_1": "Magarpatta",
"address_2": "Hadapsur",
"longitude": 18.496668,
"latitude": 73.941666,
"landmark": "Pune",
"s_token": "RC4CWvgitxUSPrP1cSoqJoj4YEqiek6l98qPrglU1DtEc2n3GDdG6paEIeGXsbPs"
] as [String : Any]

    
    static var CraeteUpadtescheduleParamerter = ["listing_id": 2,
    "s_token": "RC4CWvgitxUSPrP1cSoqJoj4YEqiek6l98qPrglU1DtEc2n3GDdG6paEIeGXsbPs",
    "availability_type_id": 1,
    "from_interval_id": 1,
    "to_interval_id": 94
        ] as [String : Any]
    
    
    static var aminitiesPostParameters = [ "s_token": "RC4CWvgitxUSPrP1cSoqJoj4YEqiek6l98qPrglU1DtEc2n3GDdG6paEIeGXsbPs",
     "listing_id": 2,
     "amenity_id": 1
        ] as [String : Any]
}
