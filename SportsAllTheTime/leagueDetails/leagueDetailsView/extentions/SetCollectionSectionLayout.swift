//
//  SetCollectionSectionLayout.swift
//  SportsAllTheTime
//
//  Created by Essam Elden Mohamed on 30/05/2023.
//

import Foundation
import UIKit
extension LeaguesDetailsViewController{
    //general method to set the section layout
    func setSectionLayout(){
        let firstLayout = UICollectionViewCompositionalLayout { [self] sectionIndex, enviroment in
            return upComingEventsCollectionView()
        }
        let secondLayout = UICollectionViewCompositionalLayout { [self] sectionIndex, enviroment in
            return showTeamsListCollectionView()
        }
        firstCollectionView.setCollectionViewLayout(firstLayout, animated: true)
        secondColletionView.setCollectionViewLayout(secondLayout, animated: true)
    }
    //section layout for upComing events
    func upComingEventsCollectionView()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(1), heightDimension: .absolute(170))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        //move animation
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
    func showTeamsListCollectionView()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.myTableView.bounds.height*0.58
    }
    
    
    func editNavigationBar(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let font = UIFont(name: "Helvetica-Bold", size: 22)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!]
    }
    
    
  
}
