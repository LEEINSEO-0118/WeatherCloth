//
//  ViewController.swift
//  WeatherCloth
//
//  Created by TOAD on 2022/03/24.
//

import UIKit
import SwiftUI

// SwiftUI Preview
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
            return ViewController()
        }

        func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        }
}
@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}



class ViewController: UIViewController {
    
    //MARK: - Objects
    private let storedLocationsButton: UIButton = {
        var button = UIButton()
//        button.setTitle("지역", for: .normal) // 이름 없어도 될듯?
//        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    private let locationName: UILabel = {
        var label = UILabel()
        label.text = "대구"
        label.textColor = UIColor.black
        label.font = UIFont(name: label.font.fontName, size: 30)
        
        return label
    }()
    
    private let dailyWeather: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout() // 없으면 collecctionView 생성이 안된다.
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // 셀 간격
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 전체 좌우 간격
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
    }()
    
    private let weekWeather: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingViews()
        delegationing()
        settingLayOut()
    }
    
    //MARK: - delegate
    func delegationing() {
        dailyWeather.dataSource = self
        dailyWeather.delegate = self
        dailyWeather.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        weekWeather.delegate = self
        weekWeather.dataSource = self
        weekWeather.register(WeekWeatherCell.self, forCellReuseIdentifier: WeekWeatherCell.identifier)
    }
    
    //MARK: - addingViews
    func addingViews() {
        self.view.addSubview(storedLocationsButton)
        self.view.addSubview(locationName)
        self.view.addSubview(dailyWeather)
        self.view.addSubview(weekWeather)
    }
    
    //MARK: - methods
    func settingLayOut() {
        
        locationName.translatesAutoresizingMaskIntoConstraints = false
        locationName.topAnchor.constraint(equalTo: view.topAnchor , constant: 50).isActive = true
        locationName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        locationName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        
        storedLocationsButton.translatesAutoresizingMaskIntoConstraints = false
        storedLocationsButton.centerYAnchor.constraint(equalTo: locationName.centerYAnchor).isActive = true
        storedLocationsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        dailyWeather.translatesAutoresizingMaskIntoConstraints = false
        dailyWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        dailyWeather.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dailyWeather.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        dailyWeather.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        dailyWeather.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        weekWeather.translatesAutoresizingMaskIntoConstraints = false
        weekWeather.topAnchor.constraint(equalTo: dailyWeather.bottomAnchor).isActive = true
        weekWeather.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        weekWeather.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        weekWeather.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }


}


//MARK: - CollectionViewExtension

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.black
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout { // cell 크기 변경
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}


//MARK: - tableViewExtension

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weekWeather.dequeueReusableCell(withIdentifier: WeekWeatherCell.identifier, for: indexPath) as! WeekWeatherCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
}
