//
//  Carousel.swift
//  WeatherCloth
//
//  Created by TOAD on 2022/03/28.
//

import UIKit

class Carousel: UIViewController {
    
    var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.blue
        
        return collectionView
        
    }()

}
