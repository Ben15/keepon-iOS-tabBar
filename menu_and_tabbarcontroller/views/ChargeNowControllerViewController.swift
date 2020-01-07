//
//  ChargeNowControllerViewController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 2/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class ChargeNowController: UITableViewController {
    
    
    //    MARK: properties
    
    //    MARK: init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        
        
    }
    
    //    MARK: methods
    
    
    
    
}
extension ChargeNowController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = "hey"
        return cell
    }
    
}
