//
//  TabbedVc1.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class TabbedVc1: UIViewController {
    
    
    //    MARK: properties
    //    MARK: inits
    //    MARK: methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        view.backgroundColor = backgroundViewColor
    

        // Do any additional setup after loading the view.
    }
    


}
