//
//  AnnouncementCell.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 15/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class AnnouncementCell: UITableViewCell {

    
//    MARK: properties
    
    
    var announcementItems = [1,2,3,4]
    var announcementItems2 = [
         announcementModel(title: "Make the most of online bookings", subtitle: "Get bookings while you sleep", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", image: #imageLiteral(resourceName: "announcement-4"), light: true),
      announcementModel(title: "Connect with more leads", subtitle: "With Keepon online bookings", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", image: #imageLiteral(resourceName: "announcement-3"), light: false),
      announcementModel(title: "Connect with more leads", subtitle: "With Keepon online bookings", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", image: #imageLiteral(resourceName: "announcement-5"), light: true),
      announcementModel(title: "Make the most of online bookings", subtitle: "Get bookings while you sleep", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", image: #imageLiteral(resourceName: "announcement-7"), light: true),
      announcementModel(title: "Make the most of online bookings", subtitle: "Get bookings while you sleep", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", image: #imageLiteral(resourceName: "announcement-2"),  light: true),
    
    ]
    var container = UIView()
    var content : UICollectionView?
    var currentIndex = 0
    let flowLayout = UICollectionViewFlowLayout()
    var announcementDelegate : openAnnouncementDelegate?
    
    
    lazy var setUpContainer = {
        
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.container)
        NSLayoutConstraint.activate([
            self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.container.heightAnchor.constraint(equalToConstant: 200),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
        ])
    }
    
    
    
    lazy var setUpContent = {
      
        
        self.content = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        
        guard let collectionView = self.content else {return}
        
        collectionView.backgroundColor = backgroundViewColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AnnouncementCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        self.flowLayout.scrollDirection = .horizontal
        
        self.container.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: 0)
        ])
    }
    
    
    
    
//    MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = backgroundColor
        setUpContainer()
        setUpContent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    MARK: method
    
    
}



extension AnnouncementCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.announcementItems2.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: container.bounds.width - 80, height: container.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnnouncementCollectionViewCell
        
        cell.data = announcementItems2[indexPath.item]
        cell.openAnnouncementDelegate = self.announcementDelegate
                        
        return cell
    }
    
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
                  
    }
        
   
    
}

