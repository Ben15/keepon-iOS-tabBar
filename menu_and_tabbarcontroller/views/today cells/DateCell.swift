//
//  DateCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    
    var bg = UIView()
    var date = UILabel()
    var day = UILabel()
    
    
    lazy var setUpBg = {
        
        self.bg.backgroundColor = UIColor(hexString: "#F7FBFF")
        self.bg.translatesAutoresizingMaskIntoConstraints = false
        self.bg.layer.cornerRadius = 4
        
        self.contentView.addSubview(self.bg)
        
        NSLayoutConstraint.activate([
            
            self.bg.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.bg.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.bg.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            self.bg.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            self.bg.heightAnchor.constraint(equalToConstant: 86)
            
        ])
        
        
        
        
        
    }
    
    lazy var setUpDate = {
        
        self.date.text = "Friday, 10th Jan 2020"
        self.date.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.date.textColor = UIColor(hexString: "425F7C")
        self.date.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.day.text = "Today"
        self.day.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        self.day.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.bg.addSubview(self.day)
        self.bg.addSubview(self.date)
        
        NSLayoutConstraint.activate([
            
            self.date.topAnchor.constraint(equalTo: self.bg.topAnchor, constant: 16),
            self.date.leftAnchor.constraint(equalTo: self.bg.leftAnchor, constant: 8),
            self.date.rightAnchor.constraint(equalTo: self.bg.rightAnchor, constant: 0),
            self.date.heightAnchor.constraint(equalToConstant: 16),
            
            self.day.topAnchor.constraint(equalTo: self.date.bottomAnchor, constant: 8),
            self.day.leftAnchor.constraint(equalTo: self.bg.leftAnchor, constant: 8),
            self.day.rightAnchor.constraint(equalTo: self.bg.rightAnchor, constant: 0),
            self.day.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setUpBg()
        setUpDate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
