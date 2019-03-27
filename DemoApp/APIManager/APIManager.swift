//
// APIManager.swift
//  SampleApp
//
//  Created by parvind bhatt on 27/03/19.
//  Copyright © 2019 parvind bhatt. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    class func weatherApi(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (Any?, NSError?) -> ()) {
        
        
        guard let url = URL(string: serviceName) else {return}

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    debugPrint(error?.localizedDescription ?? "Response Error")
                    return }
            
            do {
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode(WeatherDataModel.self, from:
                    dataResponse) //Decode JSON Response Data
                completionHandler(model,nil)

            } catch let parsingError {
                debugPrint("Error", parsingError)
                completionHandler(nil,parsingError as NSError)

            }
            
        }
        task.resume()
        
    }
}
