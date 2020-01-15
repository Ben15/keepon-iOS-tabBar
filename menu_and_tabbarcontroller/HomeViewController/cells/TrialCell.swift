//
//  TrialCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class TrialCell: UITableViewCell {

      var bg = UIView()
        var trialLength = UILabel()
        
        
        lazy var setUpBg = {
                    
            self.bg.backgroundColor = UIColor(hexString: "1C83F6")
            self.bg.translatesAutoresizingMaskIntoConstraints = false
            self.bg.layer.cornerRadius = 4
            
            self.contentView.addSubview(self.bg)
            
            NSLayoutConstraint.activate([
            
                self.bg.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                self.bg.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
                self.bg.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
                self.bg.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
                self.bg.heightAnchor.constraint(equalToConstant: 34)
                
            ])
                
          
       
            
        
        }

        lazy var setUpTrialLength = {

            self.trialLength.text = "You have 10 days left on your trial"
            self.trialLength.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            self.trialLength.textColor = .white
            self.trialLength.translatesAutoresizingMaskIntoConstraints = false

            self.bg.addSubview(self.trialLength)

            NSLayoutConstraint.activate([

                self.trialLength.leftAnchor.constraint(equalTo: self.bg.leftAnchor, constant: 16),
                self.trialLength.rightAnchor.constraint(equalTo: self.bg.rightAnchor, constant: 0),
                self.trialLength.heightAnchor.constraint(equalToConstant: 16),
                self.trialLength.centerYAnchor.constraint(equalTo: self.bg.centerYAnchor, constant: 0),
    //            self.centerXAnchor.constraint(equalTo: self.bg.centerXAnchor, constant: 0)

            ])

        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = UIColor(hexString: "F7FBFF")
                setUpBg()
                setUpTrialLength()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}
