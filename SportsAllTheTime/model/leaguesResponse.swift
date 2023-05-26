//
//  MyResponse.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
class MyResponse:Decodable{
    var success:Int?
    var result : [Results]
}
class Results:Decodable{
    var league_key:Int?
    var league_name:String?
    var country_key:Int?
    var country_name:String?
    var league_logo:String?
}
