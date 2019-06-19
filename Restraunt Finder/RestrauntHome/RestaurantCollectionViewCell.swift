//
//  RestrauntCollectionViewCell.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell : UICollectionViewCell {
    
    let restrauntImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "restraunt_default")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let restrauntNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Poppins-SemiBold", size: 16)
        label.text = "Default Restraunt"
        return label
    }()
    
    let restrauntAddressLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Poppins-Regular", size: 13)
        label.text = "Default Address"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        let inset : CGFloat = 4
        
        addSubview(restrauntImageView)
        addSubview(restrauntNameLabel)
        addSubview(restrauntAddressLabel)
        
        restrauntImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        restrauntImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        restrauntImageView.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        restrauntImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(12 * inset)).isActive = true
        
        restrauntNameLabel.topAnchor.constraint(equalTo: restrauntImageView.bottomAnchor, constant: 0).isActive = true
        restrauntNameLabel.leftAnchor.constraint(equalTo: restrauntImageView.leftAnchor, constant: 0).isActive = true
        
        restrauntAddressLabel.topAnchor.constraint(equalTo: restrauntNameLabel.bottomAnchor, constant: 0).isActive = true
        restrauntAddressLabel.leftAnchor.constraint(equalTo: restrauntNameLabel.leftAnchor, constant: 0).isActive = true 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
