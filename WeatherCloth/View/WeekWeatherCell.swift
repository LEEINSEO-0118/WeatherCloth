//
//  WeekWeatherCell.swift
//  WeatherCloth
//
//  Created by TOAD on 2022/03/29.
//

import UIKit

class WeekWeatherCell: UITableViewCell {
    
    static let identifier = "WeekWeatherCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.text = "날씨날씨"
        
        return label
    }()
    
    func setConstraint() {
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
