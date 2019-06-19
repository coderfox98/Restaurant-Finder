//
//  RestrauntHomeViewController.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class RestaurantHomeViewController : UIViewController {
    
    let navBar = LocationNavigationView()
    
    let restrauntCollectionViewCellID = "restrauntCollectionViewCellID"
    
    lazy var restrauntCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        cv.dataSource = self
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restrauntCollectionView.register(RestrauntCollectionViewCell.self, forCellWithReuseIdentifier: restrauntCollectionViewCellID)
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        view.addSubview(navBar)
        view.addSubview(restrauntCollectionView)
        
        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        navBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: view.frame.height / 12).isActive = true
        
        let inset : CGFloat = 8
        
        restrauntCollectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: inset).isActive = true
        restrauntCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset).isActive = true
        restrauntCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset).isActive = true
        restrauntCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -inset).isActive = true
        
        
       
    }
    
    func addShadow(cell : UICollectionViewCell){
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
    }
}

extension RestaurantHomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restrauntCollectionViewCellID, for: indexPath)
        addShadow(cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50, height: view.frame.height / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(RestrauntDetailViewController(), animated: true)
    }
}
