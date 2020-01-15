//
//  TodaysOnlineBookingAvailabilityEmptyCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class TodaysOnlineBookingAvailabilityEmptyCell: UITableViewCell {
    let indentifier = "customCell"
               let background = UIView()
               let container = UIView()
               let sectionLabel = UILabel()
               let stackView = UIStackView()
               let padding: CGFloat = 16
               
               
               lazy var setUpBg = {
                   
                   
                   self.background.backgroundColor = UIColor(hexString: "#F7FBFF")
                   self.background.translatesAutoresizingMaskIntoConstraints = false
                   self.contentView.addSubview(self.background)
                   
                   
                   NSLayoutConstraint.activate([
                   
                       self.background.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
                       self.background.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
                       self.background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
                       self.background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
                   
                   ])
                   
               }
               
               lazy var setUpContainer = {
                   
                   
                   self.container.backgroundColor = .white
                   self.container.translatesAutoresizingMaskIntoConstraints = false
                   self.background.addSubview(self.container)
                self.container.layer.borderColor = UIColor(hexString: "DBE3EB").cgColor
                          self.container.layer.borderWidth = 1
                    
                   self.container.layer.cornerRadius = 8
                   NSLayoutConstraint.activate([
                       self.container.leftAnchor.constraint(equalTo: self.background.leftAnchor, constant: 8),
                       self.container.rightAnchor.constraint(equalTo: self.background.rightAnchor, constant: -8),
                       self.container.topAnchor.constraint(equalTo: self.background.topAnchor, constant: 4),
                       self.container.heightAnchor.constraint(equalToConstant: 238),
                       self.container.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -4),
                   ])
               }
               
               
               
               lazy var setUpSectionLabel = {
                   
                   self.sectionLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                   self.sectionLabel.text = "Today's online booking availability"
                   self.sectionLabel.translatesAutoresizingMaskIntoConstraints = false
                   self.container.addSubview(self.sectionLabel)
                   
                   NSLayoutConstraint.activate([
                       self.sectionLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: self.padding),
                       self.sectionLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: self.padding),
                       self.sectionLabel.heightAnchor.constraint(equalToConstant: 20)
                   ])
                                   
               }
             
       
       
       lazy var setUpEmptyState = {
           
           let button = UIButton()
           button.setTitle("Get bookings while you sleep", for: .normal)
           button.backgroundColor = .systemBlue
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
           button.layer.cornerRadius = 4
           button.setTitleColor(.darkGray, for: .highlighted)
           button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonSecondary = UIButton()
                  buttonSecondary.setTitle("See example booking page", for: .normal)
                  buttonSecondary.backgroundColor = UIColor(hexString: "E4F1FF")
                  buttonSecondary.setTitleColor(UIColor(hexString: "1C83F6"), for: .normal)
                  buttonSecondary.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
                  buttonSecondary.layer.cornerRadius = 4
                  buttonSecondary.setTitleColor(.darkGray, for: .highlighted)
                  buttonSecondary.translatesAutoresizingMaskIntoConstraints = false
           
           let title = UILabel()
           title.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
           title.translatesAutoresizingMaskIntoConstraints = false
           title.textAlignment = .center
           title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           title.text = "Set up your booking page"
           
           let bodyText = UILabel()
           bodyText.frame = CGRect(x: 0, y: 0, width: 300, height: 130)
           bodyText.numberOfLines = 0
           bodyText.textAlignment = .center
            bodyText.font = UIFont.systemFont(ofSize: 12, weight: .regular)
           bodyText.translatesAutoresizingMaskIntoConstraints = false
           bodyText.text = "Book some appointments or take some time to yourself, whatever it is make sure you enjoy it."
        bodyText.alpha = 0.6
           
           
           self.container.addSubview(title)
           self.container.addSubview(bodyText)
           self.container.addSubview(button)
        self.container.addSubview(buttonSecondary)
           
           NSLayoutConstraint.activate([
           
               title.topAnchor.constraint(equalTo: self.sectionLabel.bottomAnchor, constant: 28),
               title.widthAnchor.constraint(equalToConstant: 300),
               title.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 0),
               bodyText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
               bodyText.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 0),
               bodyText.widthAnchor.constraint(equalToConstant: 300),
               button.widthAnchor.constraint(equalToConstant: 198),
               button.heightAnchor.constraint(equalToConstant: 30),
               button.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 12),
               button.centerXAnchor.constraint(equalTo: self.container.centerXAnchor),
               buttonSecondary.widthAnchor.constraint(equalToConstant: 168),
               buttonSecondary.heightAnchor.constraint(equalToConstant: 30),
               buttonSecondary.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 12),
               buttonSecondary.centerXAnchor.constraint(equalTo: self.container.centerXAnchor),
           
           ])
           
           
       }
       
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                     super.init(style: style, reuseIdentifier: reuseIdentifier)
                         setUpBg()
                         setUpContainer()
                     setUpSectionLabel()
           setUpEmptyState()
                     
                 }
               
               required init?(coder: NSCoder) {
                   fatalError("init(coder:) has not been implemented")
               }
                      

               override func setSelected(_ selected: Bool, animated: Bool) {
                   super.setSelected(selected, animated: animated)

                   // Configure the view for the selected state
               }

}
