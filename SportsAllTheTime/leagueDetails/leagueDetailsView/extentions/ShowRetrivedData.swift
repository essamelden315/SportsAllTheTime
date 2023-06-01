//
//  ShowRetrivedData.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 01/06/2023.
//

import Foundation
import UIKit
extension LeaguesDetailsViewController{
    func catchError(error:String){
        if error == "Error in upcoming"{
            firstCollectionView.addSubview(createMyView())
            networkIndication.stopAnimating()
        }
        if error == "Error in latest" {
            myTableView.addSubview(createMyView())
            networkIndication.stopAnimating()
        }
        if error == "Error in teams" {
            secondColletionView.addSubview(createMyView())
            networkIndication.stopAnimating()
        }
        print(error)
    }
    func showDataOfUpComingEvents(coming:[Events]){
            upcomingList = coming
            firstCollectionView.reloadData()
        networkIndication.stopAnimating()
    }
    func showDataOfLatestEvents(latest:[Events]){
            latestList = latest
            myTableView.reloadData()
        networkIndication.stopAnimating()
    }
    func showTeams(teams:[Team]){
            self.teams = teams
            secondColletionView.reloadData()
        networkIndication.stopAnimating()
    }
    func createMyView() -> UIView {
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        let myImage = UIImageView(image: UIImage(named: "notfound.jpeg"))
        myImage.frame = myView.bounds
        myImage.contentMode = .scaleAspectFill
        myView.addSubview(myImage)
        return myView
    }
}
