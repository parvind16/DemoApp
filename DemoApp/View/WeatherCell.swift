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

    func configureArticleTableCell(forecastObj: Forecastday) {
        // this
        weatherImageView.layer.cornerRadius = weatherImageView.frame.height/2
        weatherImageView.clipsToBounds = true
        weatherImageView.backgroundColor = .green
        temperatureLabel.text = "\(String(forecastObj.day.temperature)) °F"

        if let day = getDayOfWeek(forecastObj.date) {
            dayLabel.text = getDayName(day)
        }
    }

    func getDayOfWeek(_ today: String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }

    func getDayName(_ day: Int) -> String {

        switch day {
        case 1:
            return "Sunday"

        case 2:
            return "Monday"

        case 3:
            return "Tuesday"

        case 4:
            return "Wednesday"

        case 5:
            return "Thursday"

        case 6:
            return "Friday"

        default:
           return "Saturday"
        }
    }
}
