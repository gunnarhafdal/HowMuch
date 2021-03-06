//
//  valuta.swift
//  How Much
//
//  Created by Gunnar Hafdal on 02/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import Foundation

struct Valuta {
    
    let apiEndpoint = "https://api.exchangeratesapi.io/latest"
    
    func update(forceUpdate: Bool = false, completion: ((_ error: String?)->())? = nil) {
        let defaults = UserDefaults.standard
        let lastUpdated = defaults.double(forKey: defaultsKeys.timeWhenLastUpdated)
        
        let timeNow = Date().timeIntervalSince1970 as Double
        
        // TODO: Make it update instead after 18 UTC the day after last update or 24 hours max
        /*
         * So if we last updated at 21 GMT yesterday but it's now 19 GMT then lets update since
         * the ECB would have update the rates.
         */
        guard forceUpdate == true || timeNow - lastUpdated > 10800 else { // 3 hours cache
            completion?(nil) //we run the completion if the data is cached
            return
        }
        
        guard let fromCurrency = defaults.string(forKey: defaultsKeys.fromCurrency) else {
            completion?("Cannot get from currency")
            return
        }
        
        guard let toCurrency = defaults.string(forKey: defaultsKeys.toCurrency) else {
            completion?("Cannot get to currency")
            return
        }
        
        guard let url = URL(string: apiEndpoint) else {
            completion?("Cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                completion?("Couldn't fetch currency rate")
                return
            }
            // make sure we got data
            guard let responseData = data else {
                completion?("No response data receieved from server")
                return
            }
            
            do {
                //
                guard let resultJSON = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        completion?("Data from server not JSON")
                        return
                }
                
                guard let ratesObject = resultJSON["rates"] as? [String: Double] else {
                    completion?("JSON data not in right format")
                    return
                }
                
                guard let fromRate = fromCurrency == "EUR" ? 1.0 : ratesObject[fromCurrency] else {
                    completion?("Currency fromRate data missing from JSON")
                    return
                }
                
                guard let toRate = toCurrency == "EUR" ? 1.0 : ratesObject[toCurrency] else {
                    completion?("Currency toRate data missing from JSON")
                    return
                }
                
                let currencyRate = (1.0/fromRate) * toRate
                
                defaults.set(currencyRate, forKey: defaultsKeys.currencyRate)
                
                // we store the time now to check for updating last time
                let now = Date()
                defaults.set(now.timeIntervalSince1970 as Double, forKey: defaultsKeys.timeWhenLastUpdated)
                
                completion?(nil)
                
            } catch {
                completion?("Couldn't convert server data to JSON")
                return
            }
        }
        task.resume()
    }
}
