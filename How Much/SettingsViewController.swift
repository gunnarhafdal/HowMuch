//
//  SettingsViewController.swift
//  How Much
//
//  Created by Gunnar Hafdal on 04/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        if let fromCurrency = defaults.string(forKey: defaultsKeys.fromCurrency) {
            fromButton.setTitle("From \(fromCurrency)", for: .normal)
        }
        
        if let toCurrency = defaults.string(forKey: defaultsKeys.toCurrency) {
            toButton.setTitle("To \(toCurrency)", for: .normal)
        }
        Valuta().update()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if let vc = segue.destination as? CurrencyTableViewController {
            vc.currencyToChange = segue.identifier == "chooseFrom" ? defaultsKeys.fromCurrency : defaultsKeys.toCurrency
        }
     }
    
}
