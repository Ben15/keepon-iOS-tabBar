//
//  protocols.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import Foundation

protocol HomeControllerDelegate {
    func handleMenuOpen()
}


//HomeViewController
protocol cellButtonDelegate {
    func presentVc(navTitle:String)
}

protocol onlineBookingExampleDelegate {
    func presentSafari()
}

//AnnouncementCell
protocol openAnnouncementDelegate {
    func openAnnouncement (heading: String, body: String, image: Any)
}
