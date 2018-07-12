//
//  ConversionViewController.swift
//  How Much
//
//  Created by Gunnar Hafdal on 02/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var dollarField: UITextField!
    @IBOutlet weak var kronorLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var fromCurrencyButton: UIButton!
    @IBOutlet weak var toCurrencyButton: UIButton!
    
    var currencyRate: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        fromCurrencyButton.setTitle(defaults.string(forKey: defaultsKeys.fromCurrency), for: .normal)
        toCurrencyButton.setTitle(defaults.string(forKey: defaultsKeys.toCurrency), for: .normal)
        self.rateLabel.text = "Fetching currency rate…"
        Valuta().update(completion: updateCompletion)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dollarField.becomeFirstResponder()
    }
    
    @IBAction func dollarValueChanged(_ sender: UITextField) {
        calculateCurrency(using: sender)
    }
    
    func calculateCurrency(using textfield: UITextField) {
        guard let valueString = textfield.text else {
            kronorLabel.text = "0"
            return
        }
        
        let cleanedString = valueString.replacingOccurrences(of: ",", with: ".")
        
        guard let dollars = Double(cleanedString) else {
            kronorLabel.text = "0"
            return
        }
        
        let kronor = dollars * currencyRate
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        kronorLabel.text = formatter.string(from: kronor as NSNumber)
    }
    
    func updateCompletion(_ error: String?) {
        let defaults = UserDefaults.standard
        self.currencyRate = defaults.double(forKey: defaultsKeys.currencyRate)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        let rateString = formatter.string(from: self.currencyRate as NSNumber)
        
        DispatchQueue.main.async {
            if let error = error {
                self.rateLabel.text = "Rate: \(rateString!)\n\(error)"
            } else {
                self.rateLabel.text = "Rate: \(rateString!)"
            }
            
            self.calculateCurrency(using: self.dollarField)
        }
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

