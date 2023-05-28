//
//  TeamsResponse.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 27/05/2023.
//

import Foundation
class TeamsResponse:Decodable{
    var success:Int?
    var result:[Team]
}

class Team:Decodable{
    var team_key : Int?
    var team_name : String?
    var team_logo : String?
    var players : [Player]?
    var coaches : [Coach]?
}
class Player:Decodable{
    var player_key : Int?
    var player_name : String?
    var player_number : String?
    var player_type : String?
    var player_age : String?
    var player_image : String?
}
class Coach:Decodable{
    var coach_name : String?
    
}
