//
//  AnnouncementCollectionViewCell.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 15/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class AnnouncementCollectionViewCell: UICollectionViewCell {
    
    
//    MARK todo: make image/title/subtitle variables a function that returns itself to stop calling didset every time.
    
    var data : announcementModel? {
        
        didSet{
            print("did set")
            self.image = data?.image
            self.title.text = data?.title
            self.subtitle.text = data?.subtitle
            setUpImage()
            setUpTitles()
        }
        
    }
    var image: UIImage?
    var title = UILabel()
    var subtitle = UILabel()
    var container = UIView()
    var openAnnouncementDelegate : openAnnouncementDelegate?
    
    
    
    
    
    
    lazy var setUpContainer = {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.openAnnouncement))
        
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.backgroundColor = .systemIndigo
        self.container.layer.cornerRadius = 8
        self.container.clipsToBounds = true
        self.container.addGestureRecognizer(gesture)
        
        self.contentView.addSubview(self.container)
        NSLayoutConstraint.activate([
            self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func openAnnouncement () {
        
        guard let unwrappedData = self.data else {return}
        
        self.openAnnouncementDelegate?.openAnnouncement(data: unwrappedData)
        
    }
    
    lazy var setUpImage = {
//        guard let image = self.image else {return}
        
        let imageView = UIImageView()
        imageView.image = self.image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.container.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: 0)
        ])
        
        
        
    }
    
    
    
    
    
    
    lazy var setUpTitles = {
        
        let fontColorsLight = UIColor(hexString: "ffffff")
        let fontColorsDark = UIColor(hexString: "000000")
        guard let lightFont = self.data?.light else {return}
        
        var title = self.title
        
        title.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textColor = lightFont ? fontColorsLight : fontColorsDark
//        title.text = "Calendar integrations are coming soon"
        title.numberOfLines = 0
        
        
        var bodyText = self.subtitle
        bodyText.frame = CGRect(x: 0, y: 0, width: 300, height: 130)
        bodyText.numberOfLines = 0
        bodyText.textAlignment = .left
        bodyText.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        bodyText.textColor = lightFont ? fontColorsLight : fontColorsDark
        bodyText.alpha = lightFont ? 1 : 0.5
        bodyText.translatesAutoresizingMaskIntoConstraints = false
//        bodyText.text = "Your life's about to get a lot easier"
        
        
        self.container.addSubview(title)
        self.container.addSubview(bodyText)
        
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 8),
            title.widthAnchor.constraint(equalTo: self.container.widthAnchor, constant: -16),
            title.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 16),
            bodyText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            bodyText.widthAnchor.constraint(equalTo: self.container.widthAnchor, constant: -16),
            bodyText.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 16)
            
        ])
        
        
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("view loaded")
        setUpContainer()
   
    }
    
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
