//
//  BindingData.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
import UIKit
extension LeaguesDetailsViewController{
    
    func setBasketBallLayoutData(tableCell: DetailsTableViewCell? = nil,collectionCell: CollectionView1Cell? = nil,indexPath:Int){
        if let cell = tableCell{
            cell.homeTeamImage.sd_setImage(with: URL(string: latestList[indexPath].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.awayTeamImg.sd_setImage(with: URL(string: latestList[indexPath].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.homeTeamName.text = latestList[indexPath].event_home_team
            cell.awayTeamName.text = latestList[indexPath].event_away_team
            cell.resultLabel.text = latestList[indexPath].event_final_result
        }else{
            collectionCell!.homeTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.secondTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.homeTeamLabel.text = upcomingList[indexPath].event_home_team
            collectionCell!.awayTeamLable.text = upcomingList[indexPath].event_away_team
        }
    }
    func setTennisLayoutData(tableCell: DetailsTableViewCell? = nil,collectionCell: CollectionView1Cell? = nil,indexPath:Int){
        if let cell = tableCell{
            cell.homeTeamImage.sd_setImage(with: URL(string:latestList[indexPath].event_first_player_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.awayTeamImg.sd_setImage(with: URL(string: latestList[indexPath].event_second_player_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.homeTeamName.text = latestList[indexPath].event_first_player
            cell.awayTeamName.text = latestList[indexPath].event_second_player
            cell.resultLabel.text = latestList[indexPath].event_final_result
        }else{
            collectionCell!.homeTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_first_player_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.secondTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_second_player_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.homeTeamLabel.text = upcomingList[indexPath].event_first_player
            collectionCell!.awayTeamLable.text = upcomingList[indexPath].event_second_player
        }
    }
    
    func setCricketLayoutData(tableCell: DetailsTableViewCell? = nil,collectionCell: CollectionView1Cell? = nil,indexPath:Int){
        if let cell = tableCell{
            cell.homeTeamImage.sd_setImage(with: URL(string:latestList[indexPath].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.awayTeamImg.sd_setImage(with: URL(string: latestList[indexPath].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.homeTeamName.text = latestList[indexPath].event_home_team
            cell.awayTeamName.text = latestList[indexPath].event_away_team
            cell.resultLabel.text = latestList[indexPath].event_home_final_result
            cell.dateLabel.text = latestList[indexPath].event_date_start
        }else{
            collectionCell!.homeTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.secondTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].event_away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.homeTeamLabel.text = upcomingList[indexPath].event_first_player
            collectionCell!.awayTeamLable.text = upcomingList[indexPath].event_second_player
            collectionCell!.dateLabel.text = upcomingList[indexPath].event_date_start
        }
    }
    func setFootBallLayoutData(tableCell: DetailsTableViewCell? = nil,collectionCell: CollectionView1Cell? = nil,indexPath:Int){
        if let cell = tableCell{
            cell.homeTeamImage.sd_setImage(with: URL(string: latestList[indexPath].home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.awayTeamImg.sd_setImage(with: URL(string: latestList[indexPath].away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            cell.homeTeamName.text = latestList[indexPath].event_home_team
            cell.awayTeamName.text = latestList[indexPath].event_away_team
            cell.resultLabel.text = latestList[indexPath].event_final_result
        }else{
            collectionCell!.homeTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].home_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.secondTeamImg.sd_setImage(with: URL(string: upcomingList[indexPath].away_team_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
            collectionCell!.homeTeamLabel.text = upcomingList[indexPath].event_home_team
            collectionCell!.awayTeamLable.text = upcomingList[indexPath].event_away_team
        }
    }
}

