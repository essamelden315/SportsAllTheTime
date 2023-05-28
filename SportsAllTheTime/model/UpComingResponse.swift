//
//  UpComingResponse.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 26/05/2023.
//

import Foundation
class UpComingResponse:Decodable{
    var success:Int?
    var result:[Events]
}
class Events:Decodable{
    var event_date:String?
    var event_time:String?
    var event_final_result:String?	
    //football
    var event_home_team:String?
    var event_away_team:String?
    var home_team_logo:String?
    var away_team_logo:String?
    var event_penalty_result:String?
    //basketBall
    var event_home_team_logo:String?
    var event_away_team_logo:String?
    
    //tennis
    var event_first_player:String?
    var event_second_player:String?
    var event_first_player_logo:String?
    var event_second_player_logo:String?
    //cricket
    var event_date_start:String?
    var event_home_final_result:String?
}
