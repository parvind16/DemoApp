//
//  WeatherVC+Tabelview.swift
//  DemoApp
//
//  Created by parvind bhatt on 28/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import UIKit

extension WeatherVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: - UITableView Data Source

extension WeatherVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell
        tableViewCell?.configureArticleTableCell(forecastObj: forecasts[indexPath.row])

        return tableViewCell!
    }

} // end extension ViewController : UITableViewDataSource
