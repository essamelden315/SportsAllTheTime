//
//  RemoteDataSource.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
protocol RemoteDataSource{
    func getDataFromApi(type:String,complitionHandler : @escaping ([Results]?,Error?) -> Void )
}
