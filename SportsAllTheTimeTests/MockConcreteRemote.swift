//
//  MockConcreteRemote.swift
//  SportsAllTheTimeTests
//
//  Created by Essam Elden Mohamed on 31/05/2023.
//

import Foundation
@testable import SportsAllTheTime
class MockConcreteRemote:RemoteDataSource{
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    enum ResponseWithError : Error {
        case responseError
    }
    
    
    
    func getLeaguesData(type: String, complitionHandler: @escaping ([SportsAllTheTime.Results]?, Error?) -> Void) {
        if shouldReturnError{
            complitionHandler(nil, ResponseWithError.responseError )
        }else{   
            do{
                let mokeData = ApiResponses.mokeLeagueResponse.data(using: .utf8)!
                let resultList = try JSONDecoder().decode(LeagueResponse.self ,from: mokeData)
                complitionHandler(resultList.result,nil)
            }catch{
                print("error happend")
                complitionHandler(nil,error)
            }
        }
    }
    
    
        func getUpComingEvents(type: String, from: String, to: String, leagueID: Int, complitionHandler: @escaping ([SportsAllTheTime.Events]?, Error?) -> Void) {
            if shouldReturnError{
                complitionHandler(nil, ResponseWithError.responseError )
            }else{
                do{
                    let mokeData = ApiResponses.mokeUpComingEventsResponse.data(using: .utf8)!
                    let resultList = try JSONDecoder().decode(UpComingResponse.self ,from: mokeData)
                    complitionHandler(resultList.result,nil)
                }catch{
                    print("error happend")
                    complitionHandler(nil,error)
                }
            }
        }
    
        func getLeagueTeams(type: String, leagueID: String, teamId: String, complitionHandler: @escaping ([SportsAllTheTime.Team]?, Error?) -> Void) {
            if shouldReturnError{
                complitionHandler(nil, ResponseWithError.responseError )
            }else{
                do{
                    let mokeData = ApiResponses.mokeTeams.data(using: .utf8)!
                    let resultList = try JSONDecoder().decode(TeamsResponse.self ,from: mokeData)
                    complitionHandler(resultList.result,nil)
                }catch{
                    print("error happend")
                    complitionHandler(nil,error)
                }
            }
        }
    
}
