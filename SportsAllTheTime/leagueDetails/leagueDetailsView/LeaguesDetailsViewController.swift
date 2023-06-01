//
//  LeaguesDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit
import SDWebImage
class LeaguesDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,LeaguesDetailsViewControllerInterface {
    
    @IBOutlet weak var secondColletionView: UICollectionView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    var upcomingList = [Events]()
    var latestList = [Events]()
    var leagueType:String?
    var leagueId:Int?
    var teams = [Team]()
    var myView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigationBar()
        setSectionLayout()
        let presenter:DetailsLeaguePresenterInterface = DetailsLeaguePresenter(repo: Repository.instance(remoteObj: ConcreteRemote(),localObj: DataBase()), view: self)
        //calling for upcoming events
        presenter.getUpComingEvents(type: (leagueType?.lowercased())!, from: "2023-05-27", to: "2023-06-30", leagueID: leagueId!)
        //calling for leatest event
        presenter.getLatestEvents(type: (leagueType?.lowercased())!, from: "2023-03-01", to: "2023-05-28", leagueID: leagueId!)
        //calling for showing teams
        presenter.getLeagueTeams(type: (leagueType?.lowercased())!, leagueID: String(leagueId!),teamId: "")
        myView = createMyView()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == firstCollectionView){
            return upcomingList.count
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        //fisrt collection view (Upcoming events)
        if(collectionView == firstCollectionView){
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)as! CollectionView1Cell
            cell.timeLabel.text = upcomingList[indexPath.row].event_time
            cell.dateLabel.text = upcomingList[indexPath.row].event_date
            if leagueType == "Basketball"{
                setBasketBallLayoutData(collectionCell: cell,indexPath: indexPath.row)
            }else if leagueType == "Football"{
                setFootBallLayoutData(collectionCell: cell,indexPath: indexPath.row)
            }else if leagueType == "Tennis"{
                setTennisLayoutData(collectionCell: cell, indexPath: indexPath.row)
            }else if leagueType == "Cricket"{
                setCricketLayoutData(collectionCell: cell, indexPath: indexPath.row)
            }
            return cell
        }
        //second collection view (Teams)
        let cell = secondColletionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)as! CollectionView2Cell
        cell.teamsImg.sd_setImage(with: URL(string: teams[indexPath.row].team_logo ?? ""),placeholderImage: UIImage(named: "teamlogo.jpeg"))
        cell.teamsNameLabel.text = teams[indexPath.row].team_name
        return cell
    }
    // did select row for teams collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == secondColletionView){
            let teamDetails = self.storyboard?.instantiateViewController(withIdentifier: "team") as! TeamsDetailsViewController
            teamDetails.team = teams[indexPath.row]
            teamDetails.leagueType = leagueType
            teamDetails.isFavorite=false
            self.navigationController?.pushViewController(teamDetails, animated: true)
        }
    }
    //table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)as! DetailsTableViewCell
        cell.dateLabel.text = latestList[indexPath.row].event_date
        cell.timeLabel.text = latestList[indexPath.row].event_time
        if leagueType == "Basketball"{
            setBasketBallLayoutData(tableCell: cell,indexPath: indexPath.row)
        }else if leagueType == "Football"{
            setFootBallLayoutData(tableCell: cell,indexPath: indexPath.row)
        }else if leagueType == "Tennis"{
            setTennisLayoutData(tableCell: cell, indexPath: indexPath.row)
        }else if leagueType == "Cricket"{
            setCricketLayoutData(tableCell: cell, indexPath: indexPath.row)
        }
        return cell
    }
    func catchError(error:String){
        if error == "Error in upcoming"{
            firstCollectionView.addSubview(createMyView())
        }
        if error == "Error in latest" {
            myTableView.addSubview(createMyView())
        }
        if error == "Error in teams" {
            secondColletionView.addSubview(createMyView())
        }
        print(error)
    }
    func showDataOfUpComingEvents(coming:[Events]){
            upcomingList = coming
            firstCollectionView.reloadData()
    }
    func showDataOfLatestEvents(latest:[Events]){
            latestList = latest
            myTableView.reloadData()
    }
    func showTeams(teams:[Team]){
            self.teams = teams
            secondColletionView.reloadData()
    }
    func createMyView() -> UIView {
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        let myImage = UIImageView(image: UIImage(named: "notfound.jpeg"))
        myImage.frame = myView.bounds
        myImage.contentMode = .scaleAspectFill
        myView.addSubview(myImage)
        return myView
    }
}

