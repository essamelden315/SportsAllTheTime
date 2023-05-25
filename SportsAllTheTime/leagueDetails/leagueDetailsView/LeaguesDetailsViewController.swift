//
//  LeaguesDetailsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 23/05/2023.
//

import UIKit

class LeaguesDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var secondColletionView: UICollectionView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewCompositionalLayout { [self] sectionIndex, enviroment in
                            switch sectionIndex {
                            case 0 :
                                return foodBannerSection()
                            default:
                                return foodBannerSection()
                            }
                        }
                firstCollectionView.setCollectionViewLayout(layout, animated: true)
        listImgs = ["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
        listNames = ["Real Madrid","Bercelona","Manchester United","Elnaser"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == firstCollectionView){
            return listNames.count
        }
        return listImgs.count
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
        cell.backgroundColor = UIColor.blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == firstCollectionView){
            print("first")
        }else{
            print("second")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)as! DetailsTableViewCell
        cell.backgroundColor = UIColor.yellow
        return cell
    }
      
     func foodBannerSection()-> NSCollectionLayoutSection {
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
   static func foodCategorySection()-> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
           , heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75)
                                              , heightDimension: .fractionalHeight(0.10))
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
}
