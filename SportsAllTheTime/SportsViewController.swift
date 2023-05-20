//
//  SportsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 20/05/2023.
//

import UIKit

class SportsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        print("welcome")
        listImgs = ["bunny.jpeg","mario.jpeg"]
        listNames = ["football","basketball"]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return listImgs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! MyCollectionViewCell
        cell.img?.image =  UIImage(named: listImgs[indexPath.row])
        cell.label?.text = listNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.bounds.width*0.48), height: (collectionView.bounds.width*0.85))
        }
}
