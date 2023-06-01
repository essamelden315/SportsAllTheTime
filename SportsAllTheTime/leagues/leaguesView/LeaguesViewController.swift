//
//  LeaguesViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit
import SDWebImage
class LeaguesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate ,LeaguesViewControllerInterface{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    var leagueType:String?
    var league = [Results]()
    var isFilterd:Bool?
    var filteredData:[Results]!
    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigationBar()
        mySearchBar.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        let presenter:LeaguesPresenterInterface = LeaguesPresenter(repo: Repository.instance(remoteObj:ConcreteRemote(),localObj: DataBase()), view: self)
        presenter.getData(type:(leagueType?.lowercased())!)
        isFilterd = false
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isFilterd!){
            return filteredData.count;
        }
       return league.count
   }

 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! LeagueTableViewCell
        cell.leagueImage.sd_setImage(with: URL(string: league[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.layer.cornerRadius =  cell.leagueImage.frame.size.width/2
        cell.leagueImage.clipsToBounds = true
        if(isFilterd!){
            cell.leagueLabel?.text = filteredData[indexPath.row].league_name
            cell.leagueImage.sd_setImage(with: URL(string: filteredData[indexPath.row].league_logo ?? ""),placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
        }else{
            cell.leagueLabel?.text = league[indexPath.row].league_name
            cell.leagueImage.sd_setImage(with: URL(string: league[indexPath.row].league_logo ?? ""),placeholderImage: UIImage(named: "\(leagueType! as String)100.jpeg"))
        }
        
        return cell
   }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetails = self.storyboard?.instantiateViewController(withIdentifier: "details") as! LeaguesDetailsViewController
        leagueDetails.leagueType = self.leagueType      
        if(isFilterd!){
            leagueDetails.leagueId = filteredData[indexPath.row].league_key
        }else{
            leagueDetails.leagueId = league[indexPath.row].league_key
        }
        self.navigationController?.pushViewController(leagueDetails, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.count == 0){
            isFilterd = false;
        }else{
            isFilterd = true;
            filteredData = [Results]()
            for word in league {
                if(word.league_name!.contains(searchText)){
                    filteredData.append(word)
                }
            }
        }
        myTableView.reloadData()
    }
}
extension LeaguesViewController{
    func editNavigationBar() {
        navigationItem.title = "\(leagueType! as String) Leagues"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let font = UIFont(name: "Helvetica-Bold", size: 22)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!]
    }
    func catchError(error:Error) {
        print(error)
    }
    func showData(leagues: [Results]) {
        league = leagues
        myTableView.reloadData()
    }
}
/*
 listImgs = ["https://i.pinimg.com/236x/b9/2e/35/b92e359d679e90497e2eee2b1346d9ec.jpg",
 "https://i.pinimg.com/236x/5a/4e/8d/5a4e8d4d23fea497145b79b51559afd5.jpg",
 "https://i.pinimg.com/236x/d5/b3/ff/d5b3ff58b2923685e42de424335cefce.jpg",
 "https://i.pinimg.com/236x/65/2b/db/652bdbfe4746a4a622404f0c3637dab6.jpg"]*/
