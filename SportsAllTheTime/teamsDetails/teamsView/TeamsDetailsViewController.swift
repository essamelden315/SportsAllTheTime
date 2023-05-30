//
//  TeamsDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import UIKit
import SDWebImage
class TeamsDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  @IBOutlet weak private var teamName: UILabel!
  @IBOutlet weak private var teamImage: UIImageView!
  @IBOutlet weak private var myTableView: UITableView!
    var name:String?
    var logo:String?
    var players:[Player]?
    var coach:[Coach]?
    var isFavorite = false
    override func viewDidLoad() {
        super.viewDidLoad()
        teamName.text = name!
        if let photo = logo {
            teamImage.sd_setImage(with: URL(string: photo))
        }else{
            teamImage.image = UIImage(named: "teamlogo.jpeg")
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return coach?.count ?? 0
        default:
            return players?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! TeamTableViewCell
        switch indexPath.section {
        case 0 :
            cell.playerImage.image = UIImage(named: "coach2.jpeg")
            cell.playerName.text = coach![indexPath.row].coach_name
            break
        default:
            cell.playerImage.sd_setImage(with: URL(string: players![indexPath.row].player_image!),placeholderImage: UIImage(named: "player.jpeg"))
            cell.playerImage.layer.masksToBounds = false
            cell.playerImage.layer.cornerRadius =  cell.playerImage.frame.size.width/2
            cell.playerImage.clipsToBounds = true
            cell.playerName.text = players![indexPath.row].player_name
            cell.playerNumber.text = players![indexPath.row].player_number
        }
         
        return cell
    }
    
    @IBAction func favoriteBtn(_ sender: UIButton) {
        if isFavorite{
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.tintColor = UIColor.tintColor
            isFavorite = false
        }else{
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.tintColor = UIColor.red
            isFavorite = true
            
        }
        
    }
}
