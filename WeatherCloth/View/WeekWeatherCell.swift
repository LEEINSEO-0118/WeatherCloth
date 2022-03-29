//
//  WeekWeatherCell.swift
//  WeatherCloth
//
//  Created by TOAD on 2022/03/29.
//

import UIKit

class WeekWeatherCell: UITableViewCell {
    
//    init(_ name: String) {
//        label.text = name
//    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont(name: label.font.fontName, size: 30)
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
