//
//  LeaguesViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeaguesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,LeaguesViewControllerInterface {

    @IBOutlet weak var myTableView: UITableView!
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        listImgs = ["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
        listNames = ["Football","Basketball","Tinnes","Cricket"]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete implementation, return the number of sections
       return 1
   }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // #warning Incomplete implementation, return the number of rows
       return listNames.count
   }

 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! LeagueTableViewCell
        cell.leagueImage.image = UIImage(named: "league.jpeg")
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.layer.cornerRadius =  cell.leagueImage.frame.size.width/2
        cell.leagueImage.clipsToBounds = true
       cell.leagueLabel?.text = listNames[indexPath.row]

       return cell
   }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listNames[indexPath.row])
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let margin: CGFloat = 19
//           let contentHeight: CGFloat = 90 // Or whatever the height of your cell content is
//           return contentHeight + (2 * margin)
//    }

    

}
