//
//  AnnouncementController.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 16/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class AnnouncementController: UIViewController {

    
    var data: announcementModel? {
        
        didSet{
//            print(data)
            self.imageView.image = self.data?.image
            self.imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 260)
            self.heading.text = self.data?.title
            self.subHeading.text = self.data?.subtitle
            self.body.text = self.data?.body
        }
        
    }
    
 
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let heading: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let subHeading: UILabel = {
        
        let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let body: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: .zero)
//        scrollView.contentSize.height = 2000
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
    }()
    
    let container: UIView = {
      
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
        
    }()
    
    func setUpConstraints (){
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(scrollView)
        
        scrollView.addSubview(container)
//
        container.addSubview(imageView)
        container.addSubview(heading)
        container.addSubview(subHeading)
        container.addSubview(body)
//
        
    
        
        NSLayoutConstraint.activate([
            
            
            
            
            
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
//
//
//
//
            container.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            container.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//
//
//
//
            imageView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 260),
//
            heading.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16),
            heading.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16),
            heading.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 22),


            subHeading.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16),
            subHeading.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16),
            subHeading.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 8),


            body.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16),
            body.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16),
            body.topAnchor.constraint(equalTo: subHeading.bottomAnchor, constant: 28),
            body.bottomAnchor.constraint(equalTo: container.bottomAnchor)

            
            
        
        ])
        
                        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundViewColor
        self.navigationController?.navigationBar.isHidden = true
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    

   
   

}
