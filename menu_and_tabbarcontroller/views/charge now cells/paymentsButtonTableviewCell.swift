//
//  paymentsButtonTableviewCell.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 5/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import Foundation

import UIKit

class PaymentButtonsTableviewCell: UITableViewCell {
    
    
    
    lazy var chargeCardButton: UIButton = {
        let chargeCardBtn = UIButton()
        
        chargeCardBtn.layer.cornerRadius = 4
        chargeCardBtn.backgroundColor = .systemGreen
        chargeCardBtn.setTitle("Charge Card", for:.normal)
        chargeCardBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        chargeCardBtn.translatesAutoresizingMaskIntoConstraints = false
        return chargeCardBtn
        
    }()
    //
    lazy var paymentRequestButton: UIButton = {
        let paymentRequestBtn = UIButton()
        paymentRequestBtn.layer.cornerRadius = 4
        paymentRequestBtn.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 44)
        paymentRequestBtn.backgroundColor = .systemGreen
        paymentRequestBtn.setTitle("Send payment request", for:.normal)
        paymentRequestBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        paymentRequestBtn.translatesAutoresizingMaskIntoConstraints = false
        return paymentRequestBtn
        
    }()
    
    lazy var bgCellView: UIView = {
        let innerView = UIView()
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.layer.cornerRadius = 8
        innerView.backgroundColor = .systemGray5
        return innerView
        
    }()
    //
    
    
    
    lazy var setUpInnerView = {
        self.addSubview(self.bgCellView)
        
        
        NSLayoutConstraint.activate([
            self.bgCellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            self.bgCellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            self.bgCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.bgCellView.heightAnchor.constraint(equalToConstant: 164)
            //            self.bgCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
        
    }
    
    lazy var setUpChargeBtn = {
        self.bgCellView.addSubview(self.chargeCardButton)
        NSLayoutConstraint.activate([
            self.chargeCardButton.leftAnchor.constraint(equalTo: self.bgCellView.leftAnchor, constant: 12),
            self.chargeCardButton.rightAnchor.constraint(equalTo: self.bgCellView.rightAnchor, constant: -12 ),
            self.chargeCardButton.heightAnchor.constraint(equalToConstant: 44),
            self.chargeCardButton.topAnchor.constraint(equalTo: self.bgCellView.topAnchor , constant: 12)
        ])
    }
    
    lazy var setUpPaymentRequestButton = {
        self.bgCellView.addSubview(self.paymentRequestButton)
        NSLayoutConstraint.activate([
            self.paymentRequestButton.leftAnchor.constraint(equalTo: self.bgCellView.leftAnchor, constant: 12),
            self.paymentRequestButton.rightAnchor.constraint(equalTo: self.bgCellView.rightAnchor, constant: -12 ),
            self.paymentRequestButton.heightAnchor.constraint(equalToConstant: 44),
            self.paymentRequestButton.topAnchor.constraint(equalTo: self.chargeCardButton.bottomAnchor, constant: 8)
            
        ])
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
        
        
        
        self.bgCellView.addSubview(self.sV)
        self.sV.addArrangedSubview(self.icon1)
        self.sV.addArrangedSubview(self.icon2)
        self.sV.addArrangedSubview(self.icon3)
        self.sV.addArrangedSubview(self.icon4)
        
        NSLayoutConstraint.activate([
            
            //            self.sV.leftAnchor.constraint(equalTo: self.bgCellView.leftAnchor, constant: 20),
            //            self.sV.rightAnchor.constraint(equalTo: self.bgCellView.rightAnchor, constant: -20),
            self.sV.centerXAnchor.constraint(equalTo: self.bgCellView.centerXAnchor, constant: 0),
            self.sV.widthAnchor.constraint(equalToConstant: 180),
            self.sV.topAnchor.constraint(equalTo: self.paymentRequestButton.bottomAnchor, constant: 16)
            
            
        ])
        
        
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        setUpInnerView()
        setUpChargeBtn()
        setUpPaymentRequestButton()
        setUpStackView()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
