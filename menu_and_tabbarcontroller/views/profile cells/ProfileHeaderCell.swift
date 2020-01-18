//
//  ProfileHeaderCell.swift
//  menu_and_tabbarcontroller
//
//  Created by Ben Eblen on 17/1/20.
//  Copyright © 2020 Ben Eblen. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    let bgView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let label: UILabel = {
        
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ben Eblen Design PTY LTD"
        return label
        
    }()
    
    let profileImage: UIImageView = {
           
           let view = UIImageView()
            view.image = #imageLiteral(resourceName: "profile-tab")
            view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    
    func setUpConstraints (){
        
        contentView.addSubview(bgView)
        bgView.addSubview(label)
        bgView.addSubview(profileImage)
        
        
        NSLayoutConstraint.activate([
        
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            bgView.heightAnchor.constraint(equalToConstant: 80),
            bgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        
            label.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            
//            profileImage.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0),
            profileImage.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 16),
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.heightAnchor.constraint(equalToConstant: 50),
            profileImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
            
            
            
        
        ])
        
        
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.backgroundColor = .white
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
