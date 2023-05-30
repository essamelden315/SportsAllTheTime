//
//  FavoritesData.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
class FavoritesData{
    var name:String
    var image:String
    var key:String
    var type:String
    init(name: String, image: String, key: String, type: String) {
        self.name = name
        self.image = image
        self.key = key
        self.type = type
    }
}
