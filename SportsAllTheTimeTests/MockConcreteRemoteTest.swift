//
//  MockConcreteRemoteTest.swift
//  SportsAllTheTimeTests
//
//  Created by Essam Elden Mohamed on 01/06/2023.
//

import XCTest
@testable import SportsAllTheTime
final class MockConcreteRemoteTest: XCTestCase {
    var mokeNetwork:RemoteDataSource?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetLeaguesData(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: false)
        mokeNetwork?.getLeaguesData(type: ""){data , error in
            if let data = data {
                print(data.count)
                XCTAssertGreaterThan(data.count, 0)
            }else{
                XCTFail("")
            }
        }
    }
    func testGetLeaguesDataFail(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: true)
        mokeNetwork?.getLeaguesData(type: ""){data , error in
        XCTAssertNil(data)
        }
    }
    
    func testGetUpComingAndLatestEvents(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: false)
        mokeNetwork?.getUpComingEvents(type: "", from: "", to: "", leagueID: 1){data , error in
            if let data = data {
                XCTAssertGreaterThan(data.count, 0)
            }else{
                XCTFail("")
            }
        }
    }
    func testGetUpComingAndLatestEventsFail(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: true)
        mokeNetwork?.getUpComingEvents(type: "", from: "", to: "", leagueID: 1){data , error in
        XCTAssertNil(data)
        }
    }
    func testGetTeams(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: false)
        mokeNetwork?.getLeagueTeams(type:"", leagueID: "", teamId: ""){data , error in
            if let data = data {
                XCTAssertGreaterThan(data.count, 0)
            }else{
                XCTFail("")
            }
        }
    }
    func testGetTeamsFail(){
        mokeNetwork = MockConcreteRemote(shouldReturnError: true)
        mokeNetwork?.getLeagueTeams(type: "", leagueID: "", teamId: ""){data , error in
        XCTAssertNil(data)
        }
    }

    
}
