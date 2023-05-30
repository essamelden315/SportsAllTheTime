//
//  RemoteDataSource.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
protocol RemoteDataSource{
    func getLeaguesData(type:String,complitionHandler : @escaping ([Results]?,Error?) -> Void )
    func getUpComingEvents(type:String,from:String,to:String,leagueID:Int,complitionHandler : @escaping ([Events]?,Error?) -> Void )
    func getLeagueTeams(type:String,leagueID:Int,teamId:String,complitionHandler : @escaping ([Team]?,Error?) -> Void ) 
}
