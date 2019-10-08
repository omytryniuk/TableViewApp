//
//  ViewController.swift
//  TableViewApp
//
//  Created by Oleg Mytryniuk on 2019-10-02.
//  Copyright © 2019 Oleg Mytryniuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var healthyFoods: [String]?
    var unhealthyFoods: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.healthyFoods = ["Apple", "Banana", "Orange"]
        self.unhealthyFoods = ["Burger", "Fries", "Pizza"]
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.unhealthyFoods == nil) || (self.healthyFoods == nil) {
            return 0
        }
        
        switch section {
        case 0:
            return healthyFoods!.count
        case 1:
            return unhealthyFoods!.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (self.unhealthyFoods == nil) || (self.healthyFoods == nil) {
            return UITableViewCell()
        } else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
            let foodName = (indexPath.section == 0) ? self.healthyFoods![indexPath.row] : self.unhealthyFoods![indexPath.row]
            cell.textLabel?.text = foodName
            
            let image = UIImage(named: foodName)
            cell.imageView?.image = image
            
            cell.detailTextLabel?.text = "Row \(indexPath.row), Section \(indexPath.section)"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = indexPath.section == 0 ? "\(self.healthyFoods![indexPath.row])" : "\(self.unhealthyFoods![indexPath.row])"
        let alert = UIAlertController(title: "You selected", message: message, preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertActionCancel = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(alertActionOk)
        alert.addAction(alertActionCancel)
        self.present(alert, animated: true, completion: nil)
    }
}

