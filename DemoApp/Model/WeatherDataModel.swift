//
//  WeatherDataModel.swift
//  DemoApp
//
//  Created by parvind bhatt on 27/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import Foundation

struct WeatherDataModel: Codable {

    let location: Location
    let current: Current
    let forecast: Forecast?
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case location = "location"  //Custom keys
        case current = "current"
        case forecast = "forecast"

    }

}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
}

struct Current: Codable {
    let wind: Double
    let precip: Double
    let pressure: Double
    let temperature: Double

    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case wind = "wind_mph"  //Custom keys
        case precip = "precip_mm"
        case pressure = "pressure_mb"
        case temperature = "temp_f"

    }
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let date: String
    let day: Day
}

struct Day: Codable {

    let temperature: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "maxtemp_f"
    }
}
