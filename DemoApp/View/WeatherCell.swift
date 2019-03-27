//
//  WeatherCelll.swift
//  DemoApp
//
//  Created by parvind bhatt on 27/03/19.
// Copyright © 2019 parvind bhatt. All rights reserved.

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureArticleTableCell(forecastObj:Forecastday) {
        // this
        weatherImageView.layer.cornerRadius = weatherImageView.frame.height/2
        weatherImageView.clipsToBounds = true
        weatherImageView.backgroundColor = .green
        temperatureLabel.text = "\(String(forecastObj.day.temperature)) °F"

    }
}
