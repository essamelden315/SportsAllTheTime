//
//  LeaguesDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeaguesDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,LeaguesDetailsViewControllerInterface {
    @IBOutlet weak var secondColletionView: UICollectionView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    var listImgs = [String]()
    var listNames = [String]()
    var teams = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigationBar()
        let firstLayout = UICollectionViewCompositionalLayout { [self] sectionIndex, enviroment in
            return upComingEvents()   
        }
        let secondLayout = UICollectionViewCompositionalLayout { [self] sectionIndex, enviroment in
            return showTeamsList()
        }
        firstCollectionView.setCollectionViewLayout(firstLayout, animated: true)
        secondColletionView.setCollectionViewLayout(secondLayout, animated: true)
        listImgs = ["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
        listNames = ["Real Madrid","Bercelona","Manchester United","Elnaser"]
        teams=["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg","football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg","football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == firstCollectionView){
            return listNames.count
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == firstCollectionView){
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)as! CollectionView1Cell
            cell.homeTeamImg.image = UIImage(named: listImgs[indexPath.row])
            cell.homeTeamLabel.text = listNames[indexPath.row]
            cell.timeLabel.text = "22:00"
            cell.dateLabel.text = "25/3/2023"
            return cell
        }
        let cell = secondColletionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)as! CollectionView2Cell
        cell.teamsImg.image = UIImage(named:teams[indexPath.row])
        cell.teamsNameLabel.text = teams[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == secondColletionView){
            let teamDetails = self.storyboard?.instantiateViewController(withIdentifier: "team") as! TeamsDetailsViewController
            teamDetails.logo = teams[indexPath.row]
            teamDetails.name = teams[indexPath.row]
            self.navigationController?.pushViewController(teamDetails, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)as! DetailsTableViewCell
        return cell
    }
      
    
  
}

extension LeaguesDetailsViewController{
    func upComingEvents()-> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           let groupSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(1), heightDimension: .absolute(170))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
//             , bottom: 0, trailing: 15)
           let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
//             , bottom: 10, trailing: 0)
       section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
            let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
            let minScale: CGFloat = 0.8
            let maxScale: CGFloat = 1.0
            let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
            item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
       }
           section.orthogonalScrollingBehavior = .continuous
           return section
       }
    func showTeamsList()-> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3)
                                               , heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 0, trailing: 15)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
            , bottom: 10, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    func editNavigationBar(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let font = UIFont(name: "Helvetica-Bold", size: 22)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!]
    }
}
