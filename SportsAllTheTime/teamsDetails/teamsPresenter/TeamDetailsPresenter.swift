//
//  TeamDetailsPresenter.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
class TeamDetailsPresenter:TeamDetailsPresenterInterface{
    var repo:RepositoryInterface
    var view:TeamsDetailsViewControllerInterface
    init(repo: Repository, view: TeamsDetailsViewController) {
        self.repo = repo
        self.view = view
    }
    func addToFav(team: Team, leagueType: String){
        repo.addToFavorite(team: team, leagueType: leagueType)
    }
    func deleteFav(teamName:String){
        repo.delete(name: teamName)
    }
}
