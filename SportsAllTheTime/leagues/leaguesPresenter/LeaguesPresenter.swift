//
//  LeaguesPresenter.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import Foundation
class LeaguesPresenter:LeaguesPresenterInterface{
    let repo : RepositoryInterface
    let view : LeaguesViewControllerInterface
    init(repo: Repository, view: LeaguesViewControllerInterface) {
        self.repo = repo
        self.view = view
    }
    func getData(type:String){
        repo.getLeaguesData(type: type) { result,error in
            DispatchQueue.main.async {
                guard let result = result else{
                    self.view.catchError(error: error!)
                    return
                }
                self.view.showData(leagues: result)
            }
        }
    }

}
