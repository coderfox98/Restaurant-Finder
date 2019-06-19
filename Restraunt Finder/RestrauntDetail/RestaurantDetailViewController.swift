//
//  RestrauntDetailViewController.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class RestaurantDetailViewController : UIViewController {
    
    let restrauntImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "restraunt_default")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Detail"
        view.backgroundColor = .red
        navigationController?.isNavigationBarHidden = false
        
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        view.addSubview(restrauntImageView)
        restrauntImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        restrauntImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        restrauntImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        restrauntImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true 
    }
}
