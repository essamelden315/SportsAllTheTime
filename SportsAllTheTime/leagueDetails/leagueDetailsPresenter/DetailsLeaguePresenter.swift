//
//  DetailsLeaguePresenter.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
class DetailsLeaguePresenter:DetailsLeaguePresenterInterface{
    var repo:RepositoryInterface
    var view:LeaguesDetailsViewControllerInterface
    init(repo: Repository, view: LeaguesDetailsViewController) {
        self.repo = repo
        self.view = view
    }
    func getUpComingEvents(type: String, from: String, to: String , leagueID:Int){
        repo.getUpComingEvents(type: type, from: from, to: to, leagueID: leagueID) { result, error in
            DispatchQueue.main.async {
                guard let result = result else{
                    self.view.catchError(error: "Error in upcoming")
                    return
                }
                self.view.showDataOfUpComingEvents(coming: result)
            }
        }
    }
    func getLatestEvents(type: String, from: String, to: String , leagueID:Int){
        repo.getUpComingEvents(type: type, from: from, to: to, leagueID: leagueID) { result, error in
            DispatchQueue.main.async {
                guard let result = result else{
                    self.view.catchError(error: "Error in latest")
                    return
                }
                self.view.showDataOfLatestEvents(latest: result)
            }
        }
    }
    func getLeagueTeams(type: String, leagueID:String,teamId:String){
        repo.getLeagueTeams(type: type, leagueID: leagueID,teamId: teamId) { result, error in
            DispatchQueue.main.async {
                guard let result = result else{
                    self.view.catchError(error: "Error in teams")
                    return
                }
                self.view.showTeams(teams: result) 
            }
        }
    }
    func findTeamByID(id:Int)->Int{
        return repo.searchByID(id: id)
    }
}
