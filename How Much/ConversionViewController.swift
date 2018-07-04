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
    @IBOutlet weak var updateLabel: UIButton!
    @IBOutlet weak var updateLabelBottomConstraint: NSLayoutConstraint!
    
    var currencyRate: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ConversionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ConversionViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateCompletion),
            name: NSNotification.Name(rawValue: "valutaUpdated"),
            object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
        dollarField.attributedPlaceholder = NSAttributedString(string: "Amount",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        Valuta().update(completion: updateCompletion)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dollarField.becomeFirstResponder()
    }
    
    @IBAction func dollarValueChanged(_ sender: UITextField) {
        calculateCurrency(using: sender)
    }
    
    @IBAction func updateCurrency(_ sender: UIButton) {
        sender.isEnabled = false
        Valuta().update(forceUpdate: true, completion: updateCompletion)
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
        
        kronorLabel.text = formatter.string(from: kronor as NSNumber)
    }
    
    @objc func updateCompletion() {
        let defaults = UserDefaults.standard
        let lastUpdated = defaults.double(forKey: defaultsKeys.updateTime)
        currencyRate = defaults.double(forKey: defaultsKeys.currencyRate)
        
        let timeNow = Date(timeIntervalSince1970: lastUpdated)
        let dateString = DateFormatter.localizedString(from: timeNow, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
        
        DispatchQueue.main.async {
            self.updateLabel.setTitle("Last updated: \(dateString)", for: UIControlState.normal)
            self.updateLabel.isEnabled = true
            self.calculateCurrency(using: self.dollarField)
        }
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            updateLabelBottomConstraint.constant = 0 - keyboardSize.height
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        updateLabelBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

