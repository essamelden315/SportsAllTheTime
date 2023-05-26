//
//  Repository.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
class Repository:RepositoryInterface{
 
    private var remote : RemoteDataSource
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    static func instance(remoteObj:RemoteDataSource) -> Repository{
        let repo = Repository(remote: remoteObj)
        return repo
    }
    func getLeaguesData(type: String, complitionHandler: @escaping ([Results]?, Error?) -> Void) {
        remote.getLeaguesData(type:type,complitionHandler: complitionHandler)
    }
    
    func getUpComingEvents(type: String, from: String, to: String, leagueID: Int, complitionHandler: @escaping ([Events]?, Error?) -> Void) {
        remote.getUpComingEvents(type: type, from: from, to: to, leagueID: leagueID, complitionHandler: complitionHandler)
    }
    
    
}
