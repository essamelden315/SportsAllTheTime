//
//  ConcreteRemoteTest.swift
//  SportsAllTheTimeTests
//
//  Created by Essam Elden Mohamed on 31/05/2023.
//

import XCTest
@testable import SportsAllTheTime
final class ConcreteRemoteTest: XCTestCase {
    let network = ConcreteRemote()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetLeaguesData(){
        let expect = expectation(description: "waiting for leagues data ")
        network.getLeaguesData(type:"football"){ teams, error in
            if error != nil {
                XCTFail("faild to get data ")
                expect.fulfill()
            }else{
                if let teams = teams {
                    XCTAssertGreaterThan(teams.count, 0)
                    expect.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 10)
    }
    func testGetLeagueTeams(){
        let expect = expectation(description: "waiting for leagues data ")
        network.getLeagueTeams(type: "football", leagueID: "1", teamId: "") { teams, error in
            if error != nil {
                XCTFail("faild to get data ")
                expect.fulfill()
            }else{
                if let teams = teams {
                    XCTAssertGreaterThan(teams.count, 0)
                    expect.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 10)
    }
    func testGetUpComingEvents(){
        let expect = expectation(description: "waiting for leagues data ")
        network.getUpComingEvents(type:"football",from:"2023-05-27",to:"2023-06-30",leagueID:207) { teams, error in
            if error != nil {
                XCTFail("faild to get data ")
                expect.fulfill()
            }else{
                if let teams = teams {
                    XCTAssertGreaterThan(teams.count, 0)
                    expect.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 10)
    }
   //failure condition
    func testGetUpComingEventsFail(){
        let expect = expectation(description: "waiting for leagues data ")
        network.getUpComingEvents(type:"football",from:"2023-05-27",to:"2023-06-30",leagueID:1) { teams, error in
                    XCTAssertNil(teams)
                    expect.fulfill()
                }
        waitForExpectations(timeout: 10)
    }
}
