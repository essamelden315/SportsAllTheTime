//
//  LeaguesViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeaguesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,LeaguesViewControllerInterface {

    @IBOutlet weak var myTableView: UITableView!
    var leagueType:String?
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(leagueType! as String) Leagues"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let font = UIFont(name: "Helvetica-Bold", size: 22)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!]
        
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


    

}
