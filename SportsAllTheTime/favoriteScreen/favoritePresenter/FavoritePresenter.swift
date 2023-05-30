//
//  FavoritePresenter.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
class FavoritePresenter:FavoritePresenterInterface{
    let repo : RepositoryInterface
    let view : FavoriteTableViewInterface
    init(repo: Repository, view: FavoriteTableViewInterface) {
        self.repo = repo
        self.view = view
    }
    func showFavoritesData(){
        view.showData(favorites: repo.getUserFavorites())
    }
    func deleteFromFavorite(name:String){
        repo.delete(name: name)
    }
}
