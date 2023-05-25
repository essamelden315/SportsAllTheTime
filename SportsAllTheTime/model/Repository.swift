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
        var repo = Repository(remote: remoteObj)
        return repo
    }
    func getDataFromApi(type: String, complitionHandler: @escaping ([Results]?, Error?) -> Void) {
        remote.getDataFromApi(type:type,complitionHandler: complitionHandler)
    }
    
    
    
}
