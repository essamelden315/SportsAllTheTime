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
        if NetworkReachability.checkNetworkConnection() {
            presenter?.getLeagueTeams(type: (favoritesList![indexPath.row].type).lowercased(), leagueID: "", teamId: favoritesList![indexPath.row].key)
        }else{
            let alert:UIAlertController = UIAlertController(title: "No Connetction", message: "Check your connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert,animated: true,completion: nil)
        }
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alertDialog(index: indexPath)
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
    func alertDialog(index:IndexPath){
        let alert:UIAlertController = UIAlertController(title: "Remove", message: "Are you sure you want to remove it from favorite", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: { action in
            self.presenter?.deleteFromFavorite(name: self.favoritesList![index.row].name)
            self.favoritesList?.remove(at: index.row)
            self.tableView.deleteRows(at: [index], with: .fade)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        self.present(alert,animated: true,completion: nil)
    }
    
}
