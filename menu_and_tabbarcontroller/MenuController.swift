//
//  MenuController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var identifier = "cellId"
    var buttonLabels = ["Settings", "Online Bookings", "SMS notifications", "Bank details", "Account", "Calendar integrations"]
    
    
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpTableView()
        
    }
    
    
    func setUpTableView(){
        
        tableView = UITableView()
        
        //    tableView?.backgroundColor = .systemTeal
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        tableView.tableFooterView = UIView()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
    }
    
}

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        cell.textLabel?.text = buttonLabels[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIViewController()
        let nc = UINavigationController(rootViewController: vc)
        vc.title = "\(buttonLabels[indexPath.row])"
        vc.view.backgroundColor = .systemYellow
        present(nc, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
