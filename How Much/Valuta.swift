//
//  valuta.swift
//  How Much
//
//  Created by Gunnar Hafdal on 02/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import Foundation

struct Valuta {
    
    let apiBase = "https://www.alphavantage.co"
    let apiKey = "GBJIFQOH76BTIT9Y"
    
    func update(forceUpdate: Bool = false, completion: @escaping () -> Void) {
        let defaults = UserDefaults.standard
        let lastUpdated = defaults.double(forKey: defaultsKeys.updateTime)
        
        let timeNow = Date().timeIntervalSince1970 as Double
        
        guard forceUpdate == true || timeNow - lastUpdated > 21600 else {
            print("cache fresh from less then 6 hours ago")
            completion()
            return
        }
        
        let apiEndpoint: String = "\(apiBase)/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=DKK&apikey=\(apiKey)"
        guard let url = URL(string: apiEndpoint) else {
            print("Error: cannot create URL")
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
                print("error getting currency")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                //
                guard let resultJSON = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                guard let resultObject = resultJSON["Realtime Currency Exchange Rate"] as? [String: Any] else {
                    print("error trying to convert exchange rate")
                    return
                }
                
                guard let rate = resultObject["5. Exchange Rate"] as? String else {
                    print("Could not get rate from JSON")
                    return
                }
                print("The rate string is: " + rate)
                
                guard let rateDouble = Double(rate) else {
                    print("Could not convert rate to double")
                    return
                }
                
                defaults.set(rateDouble, forKey: defaultsKeys.currencyRate)
                
                // we store the time now to check for updating last time
                let now = Date()
                defaults.set(now.timeIntervalSince1970 as Double, forKey: defaultsKeys.updateTime)
                
                completion()
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
}
