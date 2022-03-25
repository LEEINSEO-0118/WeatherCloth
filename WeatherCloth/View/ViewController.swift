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
    
    var storedLocationsButton: UIButton = {
        var button = UIButton()
//        button.setTitle("지역", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    var locationName: UILabel = {
        var label = UILabel()
        label.text = "대구"
        label.textColor = UIColor.black
        label.font = UIFont(name: label.font.fontName, size: 30)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingViews()
        settingLayOut()
        
    }
    
    func addingViews() {
        self.view.addSubview(storedLocationsButton)
        self.view.addSubview(locationName)
    }
    func settingLayOut() {
        storedLocationsButton.translatesAutoresizingMaskIntoConstraints = false
        locationName.translatesAutoresizingMaskIntoConstraints = false
        
        locationName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        locationName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        locationName.topAnchor.constraint(equalTo: view.topAnchor , constant: 0).isActive = true
        
        storedLocationsButton.centerYAnchor.constraint(equalTo: locationName.centerYAnchor).isActive = true
        storedLocationsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }


}

