//
//  TeamDetailsPresenterInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
protocol TeamDetailsPresenterInterface{
    func addToFav(team: Team, leagueType: String)
    func deleteFav(teamName:String)
}
