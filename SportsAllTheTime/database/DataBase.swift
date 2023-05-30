//
//  DataBase.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
import SQLite3
import UIKit
import CoreData
class DataBase:LocalDataSource{
    let context: NSManagedObjectContext
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
         context = appDelegate.persistentContainer.viewContext
    }
    func addToFavorite(team:Team,leagueType:String){
        let entity = NSEntityDescription.entity(forEntityName: "Teams", in: context)!
        let teamObj = NSManagedObject(entity: entity, insertInto: context)
        teamObj.setValue(team.team_name, forKey: "team_title")
        teamObj.setValue(team.team_logo, forKey: "team_img")
        teamObj.setValue(team.team_key, forKey: "teamID")
        teamObj.setValue(leagueType, forKey: "league")
        do{
            try context.save()
            print("done essam")
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    func getUserFavorites()->[FavoritesData]{
        var data = [FavoritesData]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Teams")
        do{
            let teamdetails = try context.fetch(fetchRequest)
            for teamObj in teamdetails{
                data.append(FavoritesData(name: teamObj.value(forKey: "team_title") as! String,
                                          image: teamObj.value(forKey: "team_img") as! String,
                                          key: String(teamObj.value(forKey: "teamID")  as! Int),
                                          type: teamObj.value(forKey: "league")  as! String))
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return data
    }
}
