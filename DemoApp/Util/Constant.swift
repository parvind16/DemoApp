//
//  Constant.swift
//  SampleApp
//
//  Created by parvind bhatt on 20/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import Foundation

let kAPIKey = "d99c2ede91e047b48fa62535192703"
let kPlace = "india"

struct Constant {
    
    static let BASE_URL = Constant.apiBaseURL()

    static func apiBaseURL() -> String {
        return "http://api.apixu.com/v1/"
    }
    
    //MARK:- API Urls
    struct API {
        
        static let currentWeather = "current.json?key=\(kAPIKey)&q=\(kPlace)"
        static let forecastWeather = "forecast.json?key=\(kAPIKey)&q=\(kPlace)&days=5"

        static func apiURL(_ methodName: String) -> String {
            return BASE_URL + methodName
        }
    }
    
    struct ServerKey {
        static let status = "status"
        static let result = "results"
    }
}


