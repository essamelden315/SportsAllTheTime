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
    func getLeagueTeams(type: String, leagueID:Int,teamId:String)->Team{
        var list = Team()
        repo.getLeagueTeams(type: type, leagueID: leagueID,teamId: teamId) { result, error in
            DispatchQueue.main.async {
                guard let result = result else{
                    self.view.catchError(error: error!)
                    return
                }
                for item in result{
                    list = item
                }
                
            }
        }
        return list
    }
}
