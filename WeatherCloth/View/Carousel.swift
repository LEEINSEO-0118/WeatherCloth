//
//  Carousel.swift
//  WeatherCloth
//
//  Created by TOAD on 2022/03/28.
//

import UIKit

class Carousel: UICollectionView {
    
    var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout() // 없으면 collecctionView 생성이 안된다.
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // 셀 간격
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 전체 좌우 간격
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
        
    }()

}
