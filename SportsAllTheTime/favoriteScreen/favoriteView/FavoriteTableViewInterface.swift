//
//  FavoriteTableViewInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
protocol FavoriteTableViewInterface{
    func showData(favorites:[FavoritesData])
    func getFavData()
    func catchError(error:Error)
    func navigateToDetailsScreen(team:Team)
        
}
