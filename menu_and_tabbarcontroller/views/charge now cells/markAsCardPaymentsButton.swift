//
//  markAsCardPaymentsButton.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 5/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import Foundation

import UIKit

class markAsCardPaymentButton: UITableViewCell {
    
    
    
    
    lazy var chargeCardButton: UIButton = {
        let chargeCardBtn = UIButton()
        
        chargeCardBtn.layer.cornerRadius = 4
        chargeCardBtn.backgroundColor = .systemGreen
        chargeCardBtn.setTitle("Mark as card payment", for:.normal)
        chargeCardBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        chargeCardBtn.translatesAutoresizingMaskIntoConstraints = false
        return chargeCardBtn
        
    }()
    
    
    
    lazy var setUpChargeBtn = {
        self.addSubview(self.chargeCardButton)
        NSLayoutConstraint.activate([
            self.chargeCardButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            self.chargeCardButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12 ),
            self.chargeCardButton.heightAnchor.constraint(equalToConstant: 44),
            self.chargeCardButton.topAnchor.constraint(equalTo: self.topAnchor , constant: 12)
        ])
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        
        setUpChargeBtn()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
