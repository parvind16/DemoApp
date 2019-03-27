//
//  WeatherVC.swift
//  DemoApp
//
//  Created by parvind bhatt on 27/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var placeInfoLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherDetailLabel: UILabel!
    var forecasts: [Forecastday] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // #1 - The UITableViewDataSource and
        // UITableViewDelegate protocols are
        // adopted in extensions.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        
        activitySpinner.startAnimating()
        
        self.getCurrentWeather { [weak self] (isSucess, weather) in
           
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.updateUI(success: isSucess ?? false,weather: weather)
        }
        
        self.getForecastWeather { [weak self] (isSucess, weather) in
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.refreshForecastTabel(success: isSucess ?? false,weather: weather)
        }
    }

    func updateUI(success:Bool,weather:WeatherViewModel?){
        
        DispatchQueue.main.async {
            self.activitySpinner.stopAnimating()
            if success && weather != nil{
                self.placeInfoLabel.text = weather?.placeInfo
                self.weatherDetailLabel.text = weather?.weatherDescription
                self.temperatureLabel.text = weather?.temperature
            }
        }
        
    }
    
    func refreshForecastTabel(success:Bool,weather:WeatherViewModel?){
        
        DispatchQueue.main.async {
            self.activitySpinner.stopAnimating()
            if success && weather != nil{
               self.forecasts = weather?.weatherDataModel.forecast?.forecastday ?? []
               self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    } // end func prepare
    
}


extension WeatherVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableView Data Source

extension WeatherVC : UITableViewDataSource {
    
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

extension WeatherVC{
    
    func getCurrentWeather(completionHandler: @escaping (Bool?, WeatherViewModel?) -> ()) {
        
        APIManager.weatherApi(serviceName: Constant.API.apiURL(Constant.API.currentWeather), parameters: nil) { (response, error) in
            
            if error != nil {
                completionHandler(false, nil)
                return
            }
            
            guard let _ = response else {
                return
            }
            
            if response is WeatherDataModel{
                let weather = WeatherViewModel(weatherDataModel: response as! WeatherDataModel)
                completionHandler(true, weather)
            }
        }
    }
    
    
    func getForecastWeather(completionHandler: @escaping (Bool?, WeatherViewModel?) -> ()) {
        
        APIManager.weatherApi(serviceName: Constant.API.apiURL(Constant.API.forecastWeather), parameters: nil) { (response, error) in
            
            if error != nil {
                completionHandler(false, nil)
                return
            }
            
            guard let _ = response else {
                return
            }
            
            if response is WeatherDataModel{
                let weather = WeatherViewModel(weatherDataModel: response as! WeatherDataModel)
                completionHandler(true, weather)
            }
        }
    }
}
