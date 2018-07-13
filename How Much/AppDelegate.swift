//
//  AppDelegate.swift
//  How Much
//
//  Created by Gunnar Hafdal on 02/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        if defaults.string(forKey: defaultsKeys.fromCurrency) == nil {
            defaults.set("USD", forKey: defaultsKeys.fromCurrency)
        }
        
        if defaults.string(forKey: defaultsKeys.toCurrency) == nil {
            defaults.set("EUR", forKey: defaultsKeys.toCurrency)
        }
        
        return true
    }
}

