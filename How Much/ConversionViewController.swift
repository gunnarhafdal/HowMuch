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
    @IBOutlet weak var fromCurrencyLabel: UILabel!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    var currencyRate: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dollarField.attributedPlaceholder = NSAttributedString(string: "Amount",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        fromCurrencyLabel.text = defaults.string(forKey: defaultsKeys.fromCurrency)
        toCurrencyLabel.text = defaults.string(forKey: defaultsKeys.toCurrency)
        print("entering foreground")
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
    
    @objc func updateCompletion() {
        let defaults = UserDefaults.standard
        self.currencyRate = defaults.double(forKey: defaultsKeys.currencyRate)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        let rateString = formatter.string(from: self.currencyRate as NSNumber)
        
        DispatchQueue.main.async {
            self.rateLabel.text = "Rate: \(rateString!)"
            self.calculateCurrency(using: self.dollarField)
        }
    }
}

