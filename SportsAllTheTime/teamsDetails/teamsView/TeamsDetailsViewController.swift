//
//  TeamsDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 25/05/2023.
//

import UIKit
import SDWebImage
class TeamsDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TeamsDetailsViewControllerInterface {
  @IBOutlet weak private var teamName: UILabel!
  @IBOutlet weak private var teamImage: UIImageView!
  @IBOutlet weak private var myTableView: UITableView!
  @IBOutlet weak var favBtn: UIButton!
    let networkIndication = UIActivityIndicatorView(style: .large)
    var team:Team?
    var leagueType:String?
    var isFavorite:Bool?
    var presenter : TeamDetailsPresenterInterface?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamName.text = team?.team_name!
        if let photo = team!.team_logo {
            teamImage.sd_setImage(with: URL(string: photo))
        }else{
            teamImage.image = UIImage(named: "teamlogo.jpeg")
        }
        presenter = TeamDetailsPresenter(repo: Repository.instance(remoteObj: ConcreteRemote(), localObj: DataBase()), view: self)
        paintTheButton(isPaint: isFavorite!)
        networkIndication.color = UIColor.black
        networkIndication.center = view.center
        networkIndication.startAnimating()
        view.addSubview(networkIndication)
        if team?.players == nil {
            let myView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
            let myImage = UIImageView(image: UIImage(named: "notfound.jpeg"))
            myImage.frame = myView.bounds
            myImage.contentMode = .scaleAspectFill
            myView.addSubview(myImage)
            myTableView.addSubview(myView)
            networkIndication.stopAnimating()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return team!.coaches?.count ?? 0
        default:
            return team!.players?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! TeamTableViewCell
        switch indexPath.section {
        case 0 :
            cell.playerImage.image = UIImage(named: "coach2.jpeg")
            cell.playerName.text = team!.coaches![indexPath.row].coach_name
            break
        default:
            networkIndication.stopAnimating()
            cell.playerImage.sd_setImage(with: URL(string: team!.players![indexPath.row].player_image ?? ""),placeholderImage: UIImage(named: "player.jpeg"))
            cell.playerImage.layer.masksToBounds = false
            cell.playerImage.layer.cornerRadius =  cell.playerImage.frame.size.width/2
            cell.playerImage.clipsToBounds = true
            cell.playerName.text = team!.players![indexPath.row].player_name
            cell.playerNumber.text = team!.players![indexPath.row].player_number
        }
        return cell
    }
   
   
    
}
