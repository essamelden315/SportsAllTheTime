//
//  Repository.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
class Repository:RepositoryInterface{
    private var remote : RemoteDataSource
    private var local : LocalDataSource
    private init(remote: RemoteDataSource,local:LocalDataSource) {
        self.remote = remote
        self.local = local
    }
    static func instance(remoteObj:RemoteDataSource,localObj:LocalDataSource) -> Repository{
        let repo = Repository(remote: remoteObj,local: localObj)
        return repo
    }
    func getLeaguesData(type: String, complitionHandler: @escaping ([Results]?, Error?) -> Void) {
        remote.getLeaguesData(type:type,complitionHandler: complitionHandler)
    }
    
    func getUpComingEvents(type: String, from: String, to: String, leagueID: Int, complitionHandler: @escaping ([Events]?, Error?) -> Void) {
        remote.getUpComingEvents(type: type, from: from, to: to, leagueID: leagueID, complitionHandler: complitionHandler)
    }
    
    func getLeagueTeams(type: String, leagueID: Int,teamId:String ,complitionHandler: @escaping ([Team]?, Error?) -> Void) {
        remote.getLeagueTeams(type: type, leagueID: leagueID,teamId: teamId, complitionHandler: complitionHandler)
    }
    func addToFavorite(team: Team, leagueType: String) {
        local.addToFavorite(team: team, leagueType: leagueType)
    }
    
    func getUserFavorites() -> [FavoritesData] {
        return local.getUserFavorites()
    }
    
    func delete(name: String) {
        local.delete(name: name)
    }
    
}
