//
//  FavoritePresenterInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
protocol FavoritePresenterInterface{
    func showFavoritesData()
    func deleteFromFavorite(name:String)
    func getLeagueTeams(type: String, leagueID:String,teamId:String)
}
