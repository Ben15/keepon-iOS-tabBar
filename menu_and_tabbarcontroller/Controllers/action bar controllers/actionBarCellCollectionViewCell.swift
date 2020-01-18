//
//  actionBarCellCollectionViewCell.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 31/12/19.
//  Copyright © 2019 Ben Eblen. All rights reserved.
//

import UIKit

class actionBarCellCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    var data: actionDrawerItem? {
           didSet {
               guard let data = data else { return }
               image.image = data.image
               label.text = data.label
               
           }
       }
       
       fileprivate let image: UIImageView = {
          let iv = UIImageView()
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.contentMode = .scaleAspectFit
           iv.clipsToBounds = true
                   iv.layer.cornerRadius = 12
           return iv
       }()
    
    
    
    let label: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(hue: 211/255, saturation: 88/255, brightness: 35/255, alpha: 1)
        return label
         
        
    }()
       
       override init(frame: CGRect) {
           super.init(frame: .zero)
           


           
           contentView.addSubview(image)
           contentView.addSubview(label)
//        contentView.backgroundColor = .systemPink


        
            
        NSLayoutConstraint.activate([
        
        
        image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        
        
        
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:0 ),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:0 )
        
        ])
            
        

       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
  
}
