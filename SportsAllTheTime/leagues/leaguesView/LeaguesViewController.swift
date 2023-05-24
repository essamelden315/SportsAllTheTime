//
//  LeaguesViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeaguesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate ,LeaguesViewControllerInterface{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    var leagueType:String?
    var listImgs = [String]()
    var listNames = [String]()
    var isFilterd:Bool?
    var filteredData:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigationBar()
        mySearchBar.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        listImgs = ["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
        listNames = ["Football","Basketball","Tinnes","Cricket"]
        isFilterd = false
    }
    func numberOfSections(in tableView: UITableView) -> Int {  return 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isFilterd!){
            return filteredData.count;
        }
       return listNames.count
   }

 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! LeagueTableViewCell
        cell.leagueImage.image = UIImage(named: "league.jpeg")
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.layer.cornerRadius =  cell.leagueImage.frame.size.width/2
        cell.leagueImage.clipsToBounds = true
        if(isFilterd!){
            cell.leagueLabel?.text = filteredData[indexPath.row]
        }else{
            cell.leagueLabel?.text = listNames[indexPath.row]
        }
        
        return cell
   }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isFilterd!){
            print(filteredData[indexPath.row])
        }else{
            print(listNames[indexPath.row])
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.count == 0){
            isFilterd = false;
        }else{
            isFilterd = true;
            filteredData = [String]()
            for word in listNames {
                if(word.contains(searchText)){
                    filteredData.append(word)
                }
            } 
        }
        myTableView.reloadData()
    }
    func editNavigationBar() {
        navigationItem.title = "\(leagueType! as String) Leagues"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let font = UIFont(name: "Helvetica-Bold", size: 22)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!]
    }
  
    
   
}
