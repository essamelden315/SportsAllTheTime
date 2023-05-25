//
//  TeamsDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import UIKit

class TeamsDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  @IBOutlet weak private var teamName: UILabel!
  @IBOutlet weak private var teamImage: UIImageView!
  @IBOutlet weak private var myTableView: UITableView!
    var logo:String?
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamName.text = name!
        teamImage.image = UIImage(named: logo!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! TeamTableViewCell
         cell.playerImage.image = UIImage(named: "ronaldo.jpeg")
         cell.playerImage.layer.masksToBounds = false
         cell.playerImage.layer.cornerRadius =  cell.playerImage.frame.size.width/2
         cell.playerImage.clipsToBounds = true
        cell.playerName.text = "Cristiano Ronaldo"
        return cell
    }
}
