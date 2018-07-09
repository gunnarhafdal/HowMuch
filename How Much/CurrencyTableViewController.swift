//
//  CurrencyTableViewController.swift
//  How Much
//
//  Created by Gunnar Hafdal on 04/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UIViewController {
    
    @IBOutlet weak var currencyTable: UITableView!
    
    var currencyToChange: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyTable.delegate = self
        currencyTable.dataSource = self
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension CurrencyTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies[section].currencies.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currencies[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = currencyTable.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
        
        // Configure the cell...
        cell.code.text = currencies[indexPath.section].currencies[indexPath.row].code
        cell.name.text = currencies[indexPath.section].currencies[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(currencies[indexPath.section].currencies[indexPath.row].code, forKey: currencyToChange)
        UserDefaults.standard.set(0, forKey: defaultsKeys.timeWhenLastUpdated)
        self.dismiss(animated: true)
    }
    
}
