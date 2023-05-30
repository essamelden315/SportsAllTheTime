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
        presenter = FavoritePresenter(repo: Repository.instance(remoteObj: ConcreteRemote(), localObj: DataBase()), view: self)
         getFavData()

    }
    override func viewWillAppear(_ animated: Bool) {
        getFavData()
    }
    func getFavData(){
        presenter?.showFavoritesData()
        myTableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesList!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        LeagueTableViewCell
        cell.leagueImage.sd_setImage(with: URL(string: favoritesList![indexPath.row].image),placeholderImage: UIImage(named: "football100.jpeg"))
        cell.leagueLabel.text = favoritesList![indexPath.row].name
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func showData(favorites:[FavoritesData]){
        favoritesList = favorites
        myTableView.reloadData()
    }
    
}
