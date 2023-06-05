//
//  SportCollectionViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 22/05/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeViewController: UICollectionViewController,HomeViewControllerInterface {

    @IBOutlet var myCollectionView: UICollectionView!
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset=UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: (myCollectionView.bounds.width*0.48), height: (myCollectionView.bounds.width*0.82))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.collectionViewLayout = layout
        print("welcome")
        listImgs = ["football.jpeg","basketball.jpeg","tennis.jpeg","cricket.jpeg"]
        listNames = ["Football","Basketball","Tennis","Cricket"]
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return listImgs.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! MyCollectionViewCell
      
        cell.img?.image =  UIImage(named: listImgs[indexPath.row])
        cell.label?.text = listNames[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if NetworkReachability.checkNetworkConnection(){
            let league = self.storyboard?.instantiateViewController(withIdentifier: "league") as! LeaguesViewController
            league.leagueType = listNames[indexPath.row]
            self.navigationController?.pushViewController(league, animated: true)
            print(listNames[indexPath.row])
        }else{
            let alert:UIAlertController = UIAlertController(title: "No Connetction", message: "Check your connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert,animated: true,completion: nil)
        }
    }
    

}
