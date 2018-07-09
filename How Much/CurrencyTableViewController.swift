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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = currencyTable.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
        
        // Configure the cell...
        
        cell.name.text = currencies[indexPath.row].name
        cell.code.text = currencies[indexPath.row].code
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected \(currencies[indexPath.row].name)")
        UserDefaults.standard.set(currencies[indexPath.row].code, forKey: currencyToChange)
        UserDefaults.standard.set(0, forKey: defaultsKeys.timeWhenLastUpdated)
        self.dismiss(animated: true)
    }
    
}
