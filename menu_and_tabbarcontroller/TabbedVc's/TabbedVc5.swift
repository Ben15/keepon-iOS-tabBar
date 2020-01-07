//
//  TabbedVc5.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class TabbedVc5: UIViewController {
    
    //    MARK: properties
    //    MARK: inits
    //    MARK: methods
    
    var identifier = "cellId"
    var buttonLabels = [["Numbers", "Online Bookings", "SMS notifications", "Calendar integrations"], ["Bank details"], ["My Account"]]
    var sections = ["", "Get paid", "Account"]
    
    
    var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        navigationController?.navigationBar.prefersLargeTitles = true
//               navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               view.backgroundColor = UIColor(red: 247/255, green: 251/255, blue: 255/255, alpha: 1)
            setUpTableView()
        tableView.backgroundColor = UIColor(red: 247/255, green: 251/255, blue: 255/255, alpha: 1)
//        addNavButtons()
        
        // Do any additional setup after loading the view.
    }
 
    
    
    
    func addNavButtons (){
        
        
        let image = UIImage(named: "user-tab")
        let barButton = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        
        barButton.tintColor = .systemGray
        
       navigationItem.rightBarButtonItem = barButton
        
        
//        UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        
        
        
        
    }
    
    
     func setUpTableView(){
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorColor = UIColor(hexString: "CAD0D6")
        
    //    tableView?.backgroundColor = .systemTeal
            
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                
                self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
            
            tableView.tableFooterView = UIView()
                    
        
            tableView.delegate = self
            tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension;
        self.tableView.estimatedSectionHeaderHeight = 25;
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
            
        }
        
    }

    extension TabbedVc5: UITableViewDataSource, UITableViewDelegate {
        
        
  
        func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }
        
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//            let title = self.sections[section]
//
//            return title
//        }
        
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let view = UIView()
            view.backgroundColor = UIColor(red: 247/255, green: 251/255, blue: 255/255, alpha: 1)
            
            let label = UILabel()
            label.frame = CGRect(x: 16, y: view.frame.height + 12, width: 200, height: 44)
            label.textColor = UIColor(hexString: "4F78A1")
            label.font = UIFont.systemFont(ofSize: 16, weight: .light)
            label.text = self.sections[section]
            
            view.addSubview(label)
            
            return view
            
            
        }
        
        
        func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return buttonLabels[section].count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            
            
            let backgroundView = UIView()
            
            backgroundView.backgroundColor = .systemYellow
            
            
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            let buttonName =  self.buttonLabels[indexPath.section][indexPath.row]
            cell.imageView?.image = #imageLiteral(resourceName: "cell-icon")
            cell.textLabel?.text = buttonName
            cell.selectedBackgroundView = backgroundView
    
        
            
    
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            if section == 1 {
                
                return "Get verified and add the bank account you wish funds to be transferred into"
                
            }
            return ""
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
             tableView.deselectRow(at: indexPath, animated: true)
            
            let vc = UIViewController()
            
            vc.title = "\(buttonLabels[indexPath.section][indexPath.row])"
            vc.view.backgroundColor = .white
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
      
        

}
