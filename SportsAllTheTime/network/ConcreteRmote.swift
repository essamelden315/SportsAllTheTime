//
//  ConcreteRmote.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import Foundation
class ConcreteRemote:RemoteDataSource{
    func getLeaguesData(type:String,complitionHandler : @escaping ([Results]?,Error?) -> Void ){
           let url = URL(string: "https://apiv2.allsportsapi.com/\(type)/?met=Leagues&APIkey=60a5610cf9f3a1e045e06a5da8c9d7361e0a8c04a3c321c9684d32d7e3db27c6&from=&to=&")
           let request = URLRequest(url: url!)
           let session = URLSession(configuration: URLSessionConfiguration.default)
           let task = session.dataTask(with: request, completionHandler: {
               (data,response,error)  in
               guard let data = data else{
                   complitionHandler(nil,error!)
                   return
               }
               do{
                   let result = try JSONDecoder().decode(MyResponse.self , from: data)
                   complitionHandler(result.result,nil)
               }catch{
                   print("error happend")
                   complitionHandler(nil,error)
               }
           })
           task.resume()
   }
    func getUpComingEvents(type:String,from:String,to:String,leagueID:Int,complitionHandler : @escaping ([Events]?,Error?) -> Void ) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(type)/?met=Fixtures&APIkey=60a5610cf9f3a1e045e06a5da8c9d7361e0a8c04a3c321c9684d32d7e3db27c6&from=\(from)&to=\(to)&leagueId=\(leagueID)&timezone=Africa/Cairo")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {
            (data,response,error)  in
            guard let data = data else{
                complitionHandler(nil,error!)
                return
            }
            do{
                let result = try JSONDecoder().decode(UpComingResponse.self , from: data)
                complitionHandler(result.result,nil)
            }catch{
                print("error happend")
                complitionHandler(nil,error)
            }
        })
        task.resume()
    }
}
