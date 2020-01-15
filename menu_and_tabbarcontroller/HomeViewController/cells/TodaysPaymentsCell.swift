
//
//  TableViewCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class TodaysPaymentsCell: UITableViewCell {
    
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
            self.container.heightAnchor.constraint(equalToConstant: 157),
            self.container.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -4),
        ])
    }
    
    
    
    lazy var setUpSectionLabel = {
        
        self.sectionLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.sectionLabel.text = "Todays Payments"
        self.sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.container.addSubview(self.sectionLabel)
        
        NSLayoutConstraint.activate([
            self.sectionLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: self.padding),
            self.sectionLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: self.padding),
            self.sectionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
    }
    
    
    lazy var setUpStackView = {
        
        
        self.stackView.alignment = .center
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        self.stackView.backgroundColor = .systemBlue
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.container.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
        
            self.stackView.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: self.padding),
            self.stackView.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -self.padding),
//            self.stackView.heightAnchor.constraint(equalToConstant: 40),
            self.stackView.topAnchor.constraint(equalTo: self.sectionLabel.bottomAnchor, constant: 18)
        
        ])
        
             
             
        

        
        self.stackView.addArrangedSubview(self.pendingPayments)
        self.stackView.addArrangedSubview(self.clearedPayments)
        self.stackView.addArrangedSubview(self.numberOfPayments)
                
    }
    
    
    
    
    
    
    
    
    func createSection (title:String, amount:Float? = nil, amountInt:Int? = nil) -> UIView {
        
                
        
        
        let heading = UILabel()
        heading.text = title
        heading.alpha = 0.7
        heading.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        heading.translatesAutoresizingMaskIntoConstraints = false
        
        let number = UILabel()
        number.text = (amount != nil) ? "$\(String(amount!))" : String(amountInt!)
        number.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        number.translatesAutoresizingMaskIntoConstraints = false

        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(heading)
        containerView.addSubview(number)
        
        NSLayoutConstraint.activate([
            
            containerView.heightAnchor.constraint(equalToConstant: 46),
            heading.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            number.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 8),
            number.heightAnchor.constraint(equalToConstant: 20)
        ])
        
            return containerView
        
        
        
        
    }
    
    
  lazy var pendingPayments = { () -> UIView in
    
    return createSection(title: "Pending", amount: 1200.00)
    
    }()
    
    
    lazy var clearedPayments = { () -> UIView in
        return createSection(title: "Cleared", amount: 800.0)
        
      }()

    lazy var numberOfPayments = { () -> UIView in

  return createSection(title: "# of payments", amountInt: 10)
       
       
         }()
    
    
    
    
    lazy var setUpOverdueBookings = {
        
          let label = UILabel()
              label.text = "You have 10 overdue payments"
              label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
              label.translatesAutoresizingMaskIntoConstraints = false
        
        self.container.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 24),
            label.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 16),
            label.widthAnchor.constraint(equalTo: self.container.widthAnchor, constant: 0)
        ])
        
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpBg()
            setUpContainer()
        setUpSectionLabel()
        setUpStackView()
        setUpOverdueBookings()


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
