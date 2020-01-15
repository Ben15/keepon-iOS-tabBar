//
//  CenterController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 30/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class baseController: UITabBarController, UITabBarControllerDelegate{
    
    //    MARK: properties
    var Vc1 : UIViewController?
    var Vc2 : UIViewController?
    var Vc3 : UIViewController?
    var Vc4 : UIViewController?
    var Vc5 : UIViewController?
    
    var actionDrawer : UIViewController?
    var isActionButtonPressed = false
    weak var backgroundVignette : UIView?
    
    var button : UIButton?
    
    
    var customDelegate : HomeControllerDelegate?
    
    //    MARK: inits
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //         view.backgroundColor = .systemRed
        setUpTabs()
        addMiddleButton()
    }
    
    
    //    MARK: methods
    
    
    
    func addMiddleButton (){
        
        let buttonBackground = UIImageView()
        let image = UIImage(named: "action-tab")
        let button = UIButton()
        
        buttonBackground.image = image
        buttonBackground.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        button.layer.cornerRadius = 35
        button.backgroundColor = .white
        button.layer.borderWidth = 4
        button.layer.borderColor = #colorLiteral(red: 0.6565752625, green: 0.741325438, blue: 0.7717830539, alpha: 0.2487960188)
        
        button.addSubview(buttonBackground)
        
        
        buttonBackground.center.x = button.center.x
        buttonBackground.center.y = button.center.y
        
        
        button.addTarget(self, action: #selector(middleButtonPress), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            
            button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
        ])
        
        self.button = button
        
        
        
        
    }
    
    
    func addBackgroundVignette (){        
        
        let vignetteView = UIView()
        vignetteView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        vignetteView.backgroundColor = .black
        vignetteView.alpha = 0
        self.backgroundVignette = vignetteView
        view.insertSubview(self.backgroundVignette!, belowSubview: actionDrawer!.view)
        
    }
    
    
    func scaleButtonAnimation (){
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.button?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        })
    }
    
    
    @objc func middleButtonPress (){
        
        
        scaleButtonAnimation()
        addActionDrawer()
        
        if isActionButtonPressed {
            
        } else if !isActionButtonPressed {
            
            addBackgroundVignette()
            
        }
        
        animateActionDrawer()
        isActionButtonPressed.toggle()
        
        
        
        
    }
    
   
   @objc func handleProfileTap (){
    let vc = TabbedVc5()
    let nc = UINavigationController(rootViewController: vc)
    vc.title = "Profile"
               present(nc, animated: true, completion: nil)
               
           }
    
    lazy var setUpTabs = {
        
        self.Vc1 = HomeViewController()
        self.Vc2 = TabbedVc2()
        self.Vc3 = TabbedVc3()
        self.Vc4 = TabbedVc4()
        self.Vc5 = TabbedVc5()
        
        
        
        
    
        self.Vc2?.navigationItem.title = "Calendar"
        self.Vc3?.navigationItem.title = "View Controller 3"
        self.Vc4?.navigationItem.title = "Numbers"
        self.Vc5?.navigationItem.title = "More"
        
        
        
        let settingsBarItem = UIBarButtonItem.init(image: UIImage(named: "settings-tab"), style: .done, target: self, action: #selector(self.handleProfileTap))
        
        self.Vc1?.navigationItem.rightBarButtonItem = settingsBarItem
            
//            UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(self.handleProfileTap))
        
        self.Vc2?.navigationItem.leftBarButtonItem = settingsBarItem
        
        self.Vc4?.navigationItem.leftBarButtonItem = settingsBarItem
        
       
        
        
        let vc1 = UINavigationController(rootViewController: self.Vc1!)
        vc1.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(named: "home-tab"), selectedImage: UIImage(named: "home-tab"))
        
        vc1.navigationBar.isTranslucent = false
        vc1.navigationBar.barTintColor = UIColor(hexString: "F7FBFF")
        vc1.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        vc1.navigationBar.shadowImage = UIImage()
//        vc1.navigationBar.layoutIfNeeded()
        
        vc1.tabBarItem.badgeValue = "12"
        vc1.title = ""
        vc1.tabBarItem.tag = 0
        
        
        let vc2 = UINavigationController(rootViewController: self.Vc2!)
        vc2.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar-tab"), selectedImage: UIImage(named: "calendar-tab"))
        vc2.tabBarItem.tag = 1
        vc2.title = ""
        
        let vc3 = UINavigationController(rootViewController: self.Vc3!)
        vc3.tabBarItem = UITabBarItem(title: "Finances", image: UIImage(named: "action-tab"), selectedImage: UIImage(named: "action-tab-selected"))
        vc3.tabBarItem.image = vc3.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.selectedImage = vc3.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.tag = 2
        vc3.title = ""
        
        let vc4 = UINavigationController(rootViewController: self.Vc4!)
        vc4.tabBarItem = UITabBarItem(title: "Finances", image: UIImage(named: "finance-tab"), selectedImage: UIImage(named: "finance-tab"))
        vc4.tabBarItem.tag = 3
        vc4.title = ""
        
        
        let vc5 = UINavigationController(rootViewController: self.Vc5!)
        vc5.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "client-tab"), selectedImage: UIImage(named: "client-tab"))
        vc5.tabBarItem.tag = 4
        //    vc5.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5.0)
        vc5.title = ""
        
        
        
        
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .systemYellow
        
        let controllers = [vc1, vc2, vc3, vc4, vc5]
        self.viewControllers = controllers
        
    }
    
    
    
    func addActionDrawer (){
        
        if self.actionDrawer == nil{
            
            
            let vc = ActionDrawerController()
            vc.view.frame = CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height)
            vc.view.backgroundColor = .clear
            actionDrawer = vc
            addChild(self.actionDrawer!)
            view.insertSubview(self.actionDrawer!.view, at: 1)
            
            actionDrawer?.didMove(toParent: self)
            
            self.actionDrawer?.view.frame.origin.y = 0 + view.frame.height
            
            
        }
        
        
    }
    
    @objc func animateActionDrawer (){
        
        if !isActionButtonPressed {
            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations:{
                
                self.actionDrawer?.view.frame.origin.y = -self.tabBar.bounds.height
                self.backgroundVignette?.alpha = 0.7
                
            }, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations:{
                
                self.actionDrawer?.view.frame.origin.y = self.view.frame.height
                self.backgroundVignette?.alpha = 0
                
            }, completion: {
                (finish: Bool) in
                
                self.backgroundVignette?.removeFromSuperview()
            })
        }
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        
        
        
        
        
        
        switch viewController.tabBarItem.tag {
        case 0:
            
            if isActionButtonPressed {
                
                animateActionDrawer()
                isActionButtonPressed.toggle()
                
            }
            
            return true
            
        case 1:
            
            if isActionButtonPressed {
                
                animateActionDrawer()
                isActionButtonPressed.toggle()
                
            }
            
            return true
        case 2:
            addActionDrawer()
            animateActionDrawer()
            isActionButtonPressed.toggle()
            return false
        case 3:
            
            if isActionButtonPressed {
                
                animateActionDrawer()
                isActionButtonPressed.toggle()
                
            }
            
            return true
        case 4:
            
            if isActionButtonPressed {
                
                animateActionDrawer()
                isActionButtonPressed.toggle()
                
            }
            
            //          handleMenuTap()
            return true
        default:
            return true
        }
        
        
    }
    
    
    @ objc func handleMenuTap () {        
        
        self.customDelegate?.handleMenuOpen()
        
    }
    
    
    
}



