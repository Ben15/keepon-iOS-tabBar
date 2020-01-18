//
//  ActionDrawerController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 31/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class ActionDrawerController: UIViewController {
    
    
    //    MARK: properties
    var container = UIViewController()
    var collectionView : UICollectionView!
    var data: [actionDrawerItem] = [
        actionDrawerItem(image: UIImage(named: "charge-card")!, label: "Charge Now"),
        actionDrawerItem(image: UIImage(named: "record-expense")!, label: "Sell Subscription"),
        actionDrawerItem(image: UIImage(named: "add-subscription")!, label: "Add Expense"),
        
        actionDrawerItem(image: UIImage(named: "add-pack")!, label: "Sell Pack"),
        actionDrawerItem(image: UIImage(named: "add-appointment")!, label: "Add Appointment"),
        actionDrawerItem(image: UIImage(named: "add-client")!, label: "Add Client")
    ]
    
    //    MARK: inits
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        setUpDrawerContainer()
        setUpDrawerHandle()
        setUpOptionsCollectionView()
        
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(actionBarCellCollectionViewCell.self, forCellWithReuseIdentifier: actionBarCellCollectionViewCell.identifier)
        self.collectionView.backgroundColor = .white
        
        
    }
    
    //    MARK: methods
    
    
    
    
    
    func setUpOptionsCollectionView (){
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.container.view.addSubview(collectionView)
        container.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.container.view.topAnchor, constant: 26),
            collectionView.bottomAnchor.constraint(equalTo: self.container.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.container.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.container.view.trailingAnchor),
        ])
        
        self.collectionView = collectionView
        
    }
    
    func setUpDrawerContainer (){
        
        container = UIViewController()
        container.view.backgroundColor = .white
        container.view.layer.cornerRadius = 8
        container.view.frame = CGRect(x: 8, y: view.frame.height - 290, width: view.frame.width - 16, height: 280)
        container.view.clipsToBounds = true
        
        addChild(container)
        view.addSubview(container.view)
        container.didMove(toParent: self)
        
        
    }
    
    
    
    func setUpDrawerHandle (){
        
        let handle = UIView()
        handle.backgroundColor = .white
        handle.alpha = 0.6
        handle.layer.cornerRadius = 3
        view.addSubview(handle)
        
        handle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            handle.bottomAnchor.constraint(equalTo: container.view.topAnchor, constant: -8),
            handle.heightAnchor.constraint(equalToConstant: 6),
            handle.widthAnchor.constraint(equalToConstant: 100),
            handle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            //            handle.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            //            handle.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
        ])
        
        
    }
    
    
}

extension ActionDrawerController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: actionBarCellCollectionViewCell.identifier, for: indexPath) as! actionBarCellCollectionViewCell
        
        
        let data = self.data[indexPath.item]
        cell.data = data
        return cell
        
    }
}

extension ActionDrawerController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            
            let vc = chargeNowController()
            let nc = UINavigationController(rootViewController: vc)
            vc.view.backgroundColor = .white
            
            vc.navigationItem.title = data[indexPath.item].label
            
            
            present(nc, animated: true, completion: nil)
            
        }
        
        
        
    }
}

extension ActionDrawerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
