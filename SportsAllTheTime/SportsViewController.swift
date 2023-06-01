//
//  SportsViewController.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 20/05/2023.
//

import UIKit

class SportsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var listImgs = [String]()
    var listNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset=UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (myCollectionView.bounds.width*0.5), height: (myCollectionView.bounds.width*0.82))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 3
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.collectionViewLayout = layout
        print("welcome")
        listImgs = ["football.jpeg","giraf.jpeg","bunny.jpeg","mario.jpeg"]
        listNames = ["Football","Basketball","Tinnes","Cricket"]
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(listNames[indexPath.row])
    }
    
    

}
