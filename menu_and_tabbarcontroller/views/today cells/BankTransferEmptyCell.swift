//
//  BankTransferEmptyCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 12/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class BankTransferEmptyCell: UITableViewCell {

    
            var delegate : cellButtonDelegate?
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
                    self.container.heightAnchor.constraint(equalToConstant: 258),
                    self.container.bottomAnchor.constraint(equalTo: self.background.bottomAnchor, constant: -4),
                ])
            }
            
            
            
            lazy var setUpSectionLabel = {
                
                self.sectionLabel.font = homeSectionTitle
                self.sectionLabel.text = "Funds to transfer to your bank"
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
        button.setTitle("Get Paid", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 4
        button.setTitleColor(.darkGray, for: .highlighted)
        button.addTarget(self, action: #selector(self.present), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = homeSectionEmptyStateHeading
        title.text = "Set up payments"
        
        let bodyText = UILabel()
        bodyText.frame = CGRect(x: 0, y: 0, width: 300, height: 130)
        bodyText.numberOfLines = 0
        bodyText.textAlignment = .center
         bodyText.font = homeSectionEmptyStateBody
        bodyText.alpha = 0.6
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "Get verified with our payment provider stripe and accept credit & debit card payments."
        
        
        self.container.addSubview(title)
        self.container.addSubview(bodyText)
        self.container.addSubview(button)
        
        NSLayoutConstraint.activate([
        
            title.topAnchor.constraint(equalTo: self.sectionLabel.bottomAnchor, constant: 28),
            title.widthAnchor.constraint(equalToConstant: 300),
            title.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 0),
            bodyText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            bodyText.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 0),
            bodyText.widthAnchor.constraint(equalToConstant: 300),
            button.widthAnchor.constraint(equalToConstant: 82),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 18),
            button.centerXAnchor.constraint(equalTo: self.container.centerXAnchor)
        
        
        ])
        
        
    }
    
    
    
    @objc func present (){
        print("touced")
        self.delegate?.presentVc(navTitle: "Strip Verification")
        
    }
    
    
    
    
    
    let icon1 = { () -> UIImageView in
        
        let imageView = UIImageView()
        
        imageView.frame.size = CGSize(width: 120, height: 60)
        imageView.image = #imageLiteral(resourceName: "visa")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let icon2 = { () -> UIImageView in
        
        let imageView = UIImageView()
        
        
        imageView.image = #imageLiteral(resourceName: "masterCard")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let icon3 = { () -> UIImageView in
        
        let imageView = UIImageView()
        
        
        imageView.image = #imageLiteral(resourceName: "amex")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let icon4 = { () -> UIImageView in
        
        let imageView = UIImageView()
        
        
        imageView.image = #imageLiteral(resourceName: "stripe")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    
    let sV = { () -> UIStackView in
        
        let stackV = UIStackView()
        stackV.axis = .horizontal
        stackV.distribution = .equalSpacing
        stackV.alignment = .center
        stackV.spacing = 8
        stackV.translatesAutoresizingMaskIntoConstraints = false
        
        return stackV
    }()
    
    
    
    lazy var setUpStackView = {
        
        
        
        self.container.addSubview(self.sV)
        self.sV.addArrangedSubview(self.icon1)
        self.sV.addArrangedSubview(self.icon2)
        self.sV.addArrangedSubview(self.icon3)
        self.sV.addArrangedSubview(self.icon4)
        
        NSLayoutConstraint.activate([
 
            self.sV.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 0),
            self.sV.widthAnchor.constraint(equalToConstant: 180),
            self.sV.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -34)
            
        ])
        
        
        
    }
    
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                  super.init(style: style, reuseIdentifier: reuseIdentifier)
                setUpBg()
                setUpContainer()
                setUpSectionLabel()
                setUpEmptyState()
                setUpStackView()
        
                  
              }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
                   

            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)

                // Configure the view for the selected state
            }


}
