//
//  ViewModel.swift
//  SampleApp
//
//  Created by parvind bhatt on 12/02/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import Foundation

var weatherViewModels: [WeatherViewModel] = []

class WeatherViewModel
{

    let weatherDataModel: WeatherDataModel
    init(weatherDataModel: WeatherDataModel)
    {
        self.weatherDataModel = weatherDataModel
    }
    
    public var placeInfo: String {
        return weatherDataModel.location.name+", \(weatherDataModel.location.country)"+", \(weatherDataModel.location.region)"
    }
    
    public var weatherDescription: String {
        return "Wind: \(weatherDataModel.current.wind) mph\n"+"Precip: \(weatherDataModel.current.precip) in\n"+"Pressure: \(weatherDataModel.current.pressure) in"
    }
    
    public var temperature: String {
        return
            "\(weatherDataModel.current.temperature) °F"
    }
}

