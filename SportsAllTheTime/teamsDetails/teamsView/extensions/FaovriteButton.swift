//
//  FaovriteButton.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 05/06/2023.
//

import Foundation
import UIKit
extension TeamsDetailsViewController{

    @IBAction func favoriteBtn(_ sender: UIButton) {
        if isFavorite!{
           alertDialog()       
        }else{
            presenter?.addToFav(team: team!, leagueType: leagueType!)
            isFavorite = true
            paintTheButton(isPaint: isFavorite!)
        }
        
    }
    
  
    func paintTheButton(isPaint:Bool){
        if isPaint{
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favBtn.tintColor = UIColor.red
        }else{
            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            favBtn.tintColor = UIColor.tintColor
        }
    }
}
