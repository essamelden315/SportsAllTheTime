//
//  LeaguesDetailsViewControllerInterface.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
import UIKit
protocol LeaguesDetailsViewControllerInterface{
    func catchError(error:String)
    func showDataOfUpComingEvents(coming:[Events])
    func showDataOfLatestEvents(latest:[Events])
    func showTeams(teams:[Team])
}
