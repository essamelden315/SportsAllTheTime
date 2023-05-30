//
//  DetailsLeaguePresenterInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
protocol DetailsLeaguePresenterInterface{
    func getUpComingEvents(type: String, from: String, to: String , leagueID:Int)
    func getLatestEvents(type: String, from: String, to: String , leagueID:Int)
    func getLeagueTeams(type: String, leagueID:Int,teamId:String)
}
