//
//  ViewController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    
    //    MARK: properties
    
    var centerController : UITabBarController?
    var menu: UIViewController?
    var isMenuOpen = false
    
    
    //    MARK: inits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setUpHomeController()
        
    }
    
    
    //    MARK: methods
    
    func setUpHomeController (){
        
        let homeController = baseController()
        
        homeController.customDelegate = self
        
        self.centerController = homeController
        addChild(centerController!)
        view.addSubview(centerController!.view)
        centerController?.didMove(toParent: self)
        
        
    }
    
    func setUpMenuController (){
        if self.menu == nil {
            let menuController = MenuController()
            menu = menuController
            view.insertSubview(self.menu!.view, at: 0)
            addChild(menu!)
            menu!.didMove(toParent: self)
            
        }
    }
    
    
    func toggleMenuOpen(isMenuOpen: Bool) {
        
        if !isMenuOpen {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController?.view.frame.origin.x = self.view.frame.width - 140
                
            }, completion: nil)
            
            
        } else {
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController?.view.frame.origin.x = 0
                
            }, completion: nil)
        }
        
    }
    
    
}


extension ContainerController: HomeControllerDelegate{
    func handleMenuOpen() {
        
        if !isMenuOpen {
            
            setUpMenuController()
            
        }
        
        
        toggleMenuOpen(isMenuOpen: isMenuOpen)
        self.isMenuOpen.toggle()
    }
    
    
    
    
}
