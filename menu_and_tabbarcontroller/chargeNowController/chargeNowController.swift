//
//  chargeNowController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 5/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//


import UIKit

class chargeNowController: UIViewController {
    
    var tableView = UITableView()
    var amount : String?
    var addFee : String?
    var addDiscount: String?
    
    var amountTextField = UITextField()
    var discountTextField = UITextField()
    
    
    var newFormCells = [
        [cellModel(label: "Pay as you go"), cellModel(label:"amount")],
        [cellModel(label: "Discount")],
        [cellModel(label:"Add domestic fee"),cellModel(label:"Add Int fee")],
        [cellModel(label:"Payment method")],
        [cellModel(customCell: PaymentButtonsTableviewCell())],
        [cellModel(label:"Mark as card payment")]
    ]
    
    var formCells = [
        ["Pay as you go", "hey"], [""], ["Discount"], ["Add domestic fee to price"], ["Add Int fee to price"], ["Payment method"] ,["buttons"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Charge Now"
        setUpTableView()
        
    }
    
    
    func setUpTableView () {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGray6
        tableView.keyboardDismissMode = .onDrag
        
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(PaymentButtonsTableviewCell.self, forCellReuseIdentifier: "paymentButtons")
        tableView.register(markAsCardPaymentButton.self, forCellReuseIdentifier: "markPayment")
        
        
    }
    
    
    func priceTextField () -> UITextField {
        
        amountTextField.placeholder = "$0.00"
        amountTextField.frame = CGRect(x:  16, y: 0, width: self.view.frame.width, height: 66)
        amountTextField.textAlignment = .left
        amountTextField.font = UIFont.systemFont(ofSize: 38, weight: .regular)
        amountTextField.keyboardType = .numberPad
        amountTextField.delegate = self
        return  amountTextField
    }
    
    func percentTextField () -> UITextField {
        
        discountTextField.placeholder = "%"
        discountTextField.frame = CGRect(x:  -16, y: 0, width: view.frame.width, height: 44)
        discountTextField.textAlignment = .right
        discountTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        discountTextField.keyboardType = .numberPad
        discountTextField.delegate = self
        return  discountTextField
    }
    
    
    
    
    
}


extension chargeNowController: UITableViewDataSource, UITableViewDelegate,  UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.amountTextField {
            
            print()
            
        } else if textField == self.discountTextField {
            
            guard let amount = self.amount else {return false}
            
            
            self.amountTextField.isUserInteractionEnabled = true
            self.amountTextField.text = amount + "discounted"
            
            
        } else {
            print("no text fields")
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.amountTextField {
            
            self.amount = self.amountTextField.text
            
            guard let amount = self.amount else {return}
            
            guard let IntAmount = Int(amount) else {return}
            
            print(IntAmount + 4500)
            
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newFormCells.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        headerView.backgroundColor = .systemGray6
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 5,4:
            return 0
        default:
            return 20
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newFormCells[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        footerView.backgroundColor = .systemGray6
        
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x: 16, y: 0, width: footerView.frame.width - 32, height: footerView.frame.height)
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        
        
        footerView.addSubview(label)
        
        
        switch section {
        case 5:
            
            label.text = "Marking as card payment will not charge your client, it only records this payment and it’s payment type as “credit/debit card”"
            
            return footerView
        default:
            return UIView()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        switch section {
        case 5:
            return 30
        default:
            return 0
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 1 {
                return 66
            }
            
        case 4 :
            return 190
            
        case 5 :
            
            return 80
        default:
            return 44
        }
        return 44
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        let cellButtons = tableView.dequeueReusableCell(withIdentifier: "paymentButtons")!
        let markAsCardPaymentCell = tableView.dequeueReusableCell(withIdentifier: "markPayment")!
        
        let cell1Label = self.newFormCells[indexPath.section][indexPath.row].label
        
        switch indexPath.section {
            
            
        case 0:
            
            if indexPath.row == 0 {
                
                cell1.textLabel?.text = cell1Label
                cell1.accessoryType = .checkmark
                
                return cell1
                
            } else if indexPath.row == 1{
                
                cell1.addSubview(priceTextField())
                
                return cell1
            }
            
        case 1:
            
            cell1.textLabel?.text = cell1Label
            cell1.addSubview(percentTextField())
            return cell1
        case 2:
            
            if indexPath.row == 0 {
                
                cell1.textLabel?.text = cell1Label
                return cell1
                
            } else if indexPath.row == 1{
                
                cell1.textLabel?.text = cell1Label
                
                return cell1
            }
            
            
            return cell1
        case 3:
            cell1.textLabel?.text = cell1Label
            cell1.accessoryType = .disclosureIndicator
            
            return cell1
        case 4:
            return cellButtons
        case 5:
            
            return markAsCardPaymentCell
        default:
            return cell1
        }
        
        
        return UITableViewCell()
        
    }
    
}
