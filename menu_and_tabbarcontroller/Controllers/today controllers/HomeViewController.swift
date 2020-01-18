//
//  ViewController.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController {

    //    MARK: properties
    
    let tableView = UITableView()
    var cellsTwo = [
        
        homeCellModel(cell: DateCell(), cellIdentifier: "dateCell", type: .dateCell, cellClass: DateCell.self),
       
           homeCellModel(cell: AnnouncementCell(), cellIdentifier: "announcementCell", type: .announcement, cellClass: AnnouncementCell.self),
         homeCellModel(cell: TrialCell(), cellIdentifier: "trialCell", type: .trialCell, cellClass: TrialCell.self),
        homeCellModel(cell: TodaysPaymentsCell(), cellIdentifier: "todaysPayments", type:.todaysPayments, cellClass: TodaysPaymentsCell.self),
//        homecellModel(cell: BankTransferSectionCell(), cellIdentifier: "bankTransfer", type: .bankTransfer, cellClass: BankTransferSectionCell.self),
        homeCellModel(cell: BankTransferEmptyCell(), cellIdentifier: "bankTransferEmpty", type: .bankTransferEmpty, cellClass: BankTransferEmptyCell.self),
        homeCellModel(cell: NextAppointmentEmptyCell(), cellIdentifier: "nextAppointment", type: .nextAppointmentEmpty, cellClass: NextAppointmentEmptyCell.self),
        homeCellModel(cell: SubscriptionsAndPacksCell(), cellIdentifier: "subscriptionsAndPacks", type: .subscriptionsAndPacks, cellClass: SubscriptionsAndPacksCell.self),
        
        homeCellModel(cell: TodaysOnlineBookingAvailabilityEmptyCell(), cellIdentifier: "onlineBookingEmpty", type: .onlineBookingsEmpty, cellClass: TodaysOnlineBookingAvailabilityEmptyCell.self),
        
    ]
        
    
    //    MARK: inits
    
        override func viewDidLoad() {
            super.viewDidLoad()
         
            tableViewSetup()
            
        }

    
    //    MARK: methods
    

    
    
    lazy var tableViewSetup = {
        
        self.tableView.frame = self.view.frame
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerCells()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        self.tableView.backgroundColor = UIColor(hexString: "#F7FBFF")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let footer = UIView()
        footer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
        self.tableView.tableFooterView = footer
        self.view.addSubview(self.tableView)
        
    }
    
    lazy var registerCells = {
        
        for cell in self.cellsTwo {
            self.tableView.register(cell.cellClass, forCellReuseIdentifier: cell.cellIdentifier)
        }
                        
    }
                
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsTwo.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        let cellIdentifier = cellsTwo[indexPath.row].cellIdentifier
        
        switch cellsTwo[indexPath.row].type{
            
        case .dateCell:
           
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            
        case .bankTransfer:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BankTransferSectionCell
            
            cell.data = BankTransferModel(amount: 1800.00, estTime: "Est arrival time, 25 Feb 2020")
            
            return cell
        case .bankTransferEmpty:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BankTransferEmptyCell
            
            cell.delegate = self
            
            return cell
        case .defaultCell:
            return defaultCell
        case .nextAppointment:
            return defaultCell
        case .nextAppointmentEmpty:
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        case .onlineBookings:
            return defaultCell
        case .onlineBookingsEmpty:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TodaysOnlineBookingAvailabilityEmptyCell
            cell.exampleDelegate = self
            
            return cell
        case .subscriptionsAndPacks:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SubscriptionsAndPacksCell
            
            cell.delegate = self
            
            return cell
        case .todaysPayments:
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        case .todaysPaymentsEmpty:
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        case .trialCell:
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        case .announcement:
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AnnouncementCell
                
            cell.announcementDelegate = self
            
            return cell
        default:
            return defaultCell
            
        }
    }
}

extension HomeViewController: cellButtonDelegate {
    func presentVc(navTitle: String) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white        
        vc.title = navTitle
        let nc = UINavigationController(rootViewController: vc)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        present(nc, animated: true, completion: nil)
        
        
    }
    
    
    
    
}

extension HomeViewController: onlineBookingExampleDelegate {
    func presentSafari() {
        print("Example online booking")
        
        let url = URL(string: "https://app.getkeepon.com/book/keepon")
        
        let safariVC = SFSafariViewController(url: url!)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    
  
    
    
}


extension HomeViewController: openAnnouncementDelegate {
    func openAnnouncement(data: announcementModel) {
        
             let vc = AnnouncementController()
        
             let nc = UINavigationController(rootViewController: vc)
                
                vc.data = data
        
             present(nc, animated: true, completion: nil)
    }
    
      
  }
