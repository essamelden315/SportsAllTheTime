//
//  AlertDialog.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 05/06/2023.
//

import Foundation
import UIKit
extension TeamsDetailsViewController{
    func alertDialog(){
        let alert:UIAlertController = UIAlertController(title: "Remove", message: "Are you sure you want to remove it from favorite", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: { action in
            self.presenter?.deleteFav(teamName: (self.team?.team_name)!)
            self.isFavorite = false
            self.paintTheButton(isPaint: self.isFavorite!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        self.present(alert,animated: true,completion: nil)
    }
        
}
