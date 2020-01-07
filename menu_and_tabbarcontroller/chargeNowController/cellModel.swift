//
//  cellModel.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 5/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import Foundation

import UIKit

struct cellModel {
    
    var label : String?
    var input : UITextField?
    var cellHeight: Int?
    var customCell: UITableViewCell?
    
    init(label: String? = nil, input: UITextField? = nil, cellHeight: Int? = nil, customCell: UITableViewCell? = nil) {
        self.label = label
        self.input = input
        self.cellHeight = cellHeight
        self.customCell = customCell
    }
    
}
