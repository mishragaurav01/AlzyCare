//
//  ViewController.swift
//  AlzyCareRepo
//
//  Created by Batch-2 on 17/05/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
            imageView.image = UIImage(named: "RT \(indexPath.row + 1).png")
            imageView.layer.borderWidth = 2
             
        }

        return cell
    }
    
    func generateLayout() -> UICollectionViewLayout {
        //Create the item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.5), heightDimension: .fractionalHeight(0.8))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count : 9)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    

    @IBOutlet var plannerRemainder: UIButton!
    
    @IBOutlet var gamesCollectionView: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plannerRemainder.layer.cornerRadius = 25.0
        
        gamesCollectionView.dataSource = self
        gamesCollectionView.delegate = self
        gamesCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }


}

