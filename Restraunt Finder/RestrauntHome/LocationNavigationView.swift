//
//  LocationNavigationView.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit
import Firebase

class LocationNavigationView : UIView {
    
    let logOutButton = RFButton(text: "LogOut", type: "Custom", fontName: "Poppins-SemiBold", fontSize: 16)
    let locationTextField = RFTextLabel(text: "Location")
    
    private let locationManager = LocationManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupViews()
        addActionsToButtons()
        getLocation()
    }
    
    fileprivate func getLocation() {
        guard let exposedLocation = self.locationManager.exposedLocation else { print("Unable to get exposed Location")
            return }
        self.locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            self.locationTextField.text = placemark.locality
            
        }
    }
    
    fileprivate func setupViews() {
        backgroundColor = .darkerRed
        addSubview(logOutButton)
        addSubview(locationTextField)
        let inset : CGFloat = 12
        
        logOutButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        logOutButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        locationTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        locationTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true 
    }
    
    fileprivate func addActionsToButtons() {
        logOutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
    }
    
    @objc func handleLogOut() {
        do {
            try Auth.auth().signOut()
            presentViewController(viewController: LoginViewController())
        }
        catch {
            print("Unable to sign out")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
