//
//  cellModel.swift
//  KeeponHomeVc
//
//  Created by Ben Eblen on 11/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import Foundation
import UIKit


struct homeCellModel {
    
    
    enum cellType {
        case todaysPayments
        case todaysPaymentsEmpty
        case bankTransfer
        case bankTransferEmpty
        case nextAppointment
        case nextAppointmentEmpty
        case onlineBookings
        case onlineBookingsEmpty
        case subscriptionsAndPacks
        case dateCell
        case trialCell
        case announcement
        case defaultCell
    }        
    var cell: UITableViewCell
    var cellIdentifier: String
    var type = cellType.defaultCell
    var cellClass: AnyClass
}
