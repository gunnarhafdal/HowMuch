//
//  CurrencyTableViewController.swift
//  How Much
//
//  Created by Gunnar Hafdal on 04/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController {
    
    var currencyToChange: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = currencies[indexPath.row].name
        cell.detailTextLabel?.text = currencies[indexPath.row].key

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected \(currencies[indexPath.row].name)")
        UserDefaults.standard.set(currencies[indexPath.row].key, forKey: currencyToChange)
        UserDefaults.standard.set(0, forKey: defaultsKeys.timeWhenLastUpdated)
        self.dismiss(animated: true)
    }

}
