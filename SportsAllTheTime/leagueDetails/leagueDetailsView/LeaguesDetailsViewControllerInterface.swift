//
//  LeaguesDetailsViewControllerInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
import UIKit
protocol LeaguesDetailsViewControllerInterface{
    func setSectionLayout()
    func upComingEventsCollectionView()-> NSCollectionLayoutSection
    func showTeamsListCollectionView()-> NSCollectionLayoutSection
    func catchError(error:Error)
    func showDataOfUpComingEvents(coming:[Events])
    func showDataOfLatestEvents(latest:[Events])
    func editNavigationBar()
    func showTeams(teams:[Team])
}
