//
//  LocalDataSource.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
protocol LocalDataSource{
    func addToFavorite(team:Team,leagueType:String)
    func getUserFavorites()->[FavoritesData]
}
