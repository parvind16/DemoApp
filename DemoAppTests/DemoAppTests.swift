//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by parvind bhatt on 25/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import XCTest
@testable import DemoApp

class DemoAppTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testWeatherForecast() {
        testForecastForURL(host: "api.apixu.com", fileName: "Forecast.json")
    }
    func testCurrentForecast() {
        testForecastForURL(host: "api.apixu.com", fileName: "Current.json")
    }
    
    func testForecastForURL(host: String, fileName: String) {
        
        XCHttpStub.request(withPathRegex: host, withResponseFile: fileName)
        let responseExpectation = expectation(description: "return expected data of List")
        
        APIManager.weatherApi(serviceName: Constant.API.apiURL(Constant.API.forecastWeather), parameters: nil) { (response, error) in
            
            if error != nil {
                XCTAssertNotNil(error, "error: Expectation fulfilled with error")
                responseExpectation.fulfill()
                return
            }
            
            guard let _ = response else {
                return
            }
            
            if response is WeatherDataModel{
                let weather = WeatherViewModel(weatherDataModel: response as! WeatherDataModel)
                XCTAssertNotNil(weather, "list: expected result achived")
                XCTAssertNil(error, "error: Expectation fulfilled with error")
                responseExpectation.fulfill()
                
            }
        }
        
        waitForExpectations(timeout: 50) { error in
            if let error = error {
                XCTAssertNotNil(error, "Failed to get response from list webservice")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

