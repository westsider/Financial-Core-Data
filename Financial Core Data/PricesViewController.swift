//
//  PricesViewController.swift
//  Financial Core Data
//
//  Created by Warren Hansen on 1/11/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class PricesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    let titleArray = ["AAPL", "GOOG", "MSFT", "SPY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        // for custom cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!StockTableViewCell
        cell.textLabel?.text = titleArray[indexPath.row]
        
        return cell
    }

}
