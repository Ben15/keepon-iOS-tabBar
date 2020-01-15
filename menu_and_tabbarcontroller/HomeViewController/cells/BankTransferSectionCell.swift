//
//  BankTransferSectionCell.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class BankTransferSectionCell: UITableViewCell {

    var data : BankTransferModel? {
                
        didSet{
            print("DID SET!!")
            self.amount.text = data?.amount != nil ? "$\(String(data!.amount))" : "0"
            self.estimatedTime.text = data?.estTime != nil ? data?.estTime : "weee"
        }
    }
    
    var amount = UILabel()
    
    var estimatedTime = UILabel()
    
                    
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
                    self.container.heightAnchor.constraint(equalToConstant: 112),
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
                    self.stackView.topAnchor.constraint(equalTo: self.sectionLabel.bottomAnchor, constant: 18)
                
                ])
                
                self.stackView.addArrangedSubview(self.pendingPayments())
            }
            
            
            
            
            
    func createSection () -> UIView {
                
                        
                let containerWidth = self.container.frame.width / 3
                
                self.estimatedTime.text = "No funds waiting to hit your account"
                self.estimatedTime.alpha = 0.7
                self.estimatedTime.font = UIFont.systemFont(ofSize: 12, weight: .medium)
                self.estimatedTime.translatesAutoresizingMaskIntoConstraints = false
                
              
                self.amount.text = "0"
                self.amount.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
                self.amount.translatesAutoresizingMaskIntoConstraints = false

                let containerView = UIView()
                containerView.backgroundColor = .clear
                containerView.translatesAutoresizingMaskIntoConstraints = false
                
        containerView.addSubview(self.estimatedTime)
        containerView.addSubview(self.amount)
                
                NSLayoutConstraint.activate([
                    containerView.widthAnchor.constraint(equalToConstant: containerWidth),
                    containerView.heightAnchor.constraint(equalToConstant: 46),
                    self.estimatedTime.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: 8),
                    self.amount.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
                    self.amount.heightAnchor.constraint(equalToConstant: 20)
                ])
                
                    return containerView
                                                                
            }
            
            
    lazy var pendingPayments = { () -> UIView in
            
        return self.createSection()
            
            }

            
            
            override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: style, reuseIdentifier: reuseIdentifier)
                    setUpBg()
                    setUpContainer()
                setUpSectionLabel()
                setUpStackView()


                
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
