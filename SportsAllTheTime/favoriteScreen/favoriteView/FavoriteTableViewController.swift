//
//  FavoriteTableViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import UIKit

class FavoriteTableViewController: UITableViewController, FavoriteTableViewInterface {
    private var presenter : FavoritePresenterInterface?
    @IBOutlet var myTableView: UITableView!
    private var favoritesList:[FavoritesData]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter = FavoritePresenter(repo: Repository.instance(remoteObj: ConcreteRemote(), localObj: DataBase()), view: self)
         getFavData()
    }
    func getFavData(){
        presenter?.showFavoritesData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesList!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        LeagueTableViewCell
        cell.leagueImage.sd_setImage(with: URL(string: favoritesList![indexPath.row].image),placeholderImage: UIImage(named: "teamlogo.jpeg"))
        cell.leagueLabel.text = favoritesList![indexPath.row].name
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         presenter?.getLeagueTeams(type: (favoritesList![indexPath.row].type).lowercased(), leagueID: "", teamId: favoritesList![indexPath.row].key)
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.deleteFromFavorite(name: favoritesList![indexPath.row].name)
            favoritesList?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func catchError(error:Error){
        print(error.localizedDescription)
    }

    func showData(favorites:[FavoritesData]){
        favoritesList = favorites
        myTableView.reloadData()
    }
    func navigateToDetailsScreen(team:Team){
        
        let teamDetails = self.storyboard?.instantiateViewController(withIdentifier: "team") as! TeamsDetailsViewController
        teamDetails.team = team
        teamDetails.leagueType = ""
        teamDetails.isFavorite = true
        self.navigationController?.pushViewController(teamDetails, animated: true)
    }
    
}
