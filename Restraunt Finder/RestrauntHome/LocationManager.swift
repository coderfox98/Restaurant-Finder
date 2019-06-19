//
//  LocationManager.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject {
    
    private let locationManager = CLLocationManager()
    
    public var exposedLocation : CLLocation? {
        return self.locationManager.location
    }
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}
extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Not determined")
        case .authorizedWhenInUse: print("Authorized when in use")
        case .authorizedAlways : print("Authorize Always")
        case .restricted : print("User denied")
        case .denied : print("denied")
        }
    }
    
    func getPlace(for location : CLLocation,completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Error",error.localizedDescription)
                completion(nil)
                return
            }
            guard let placemark = placemarks?[0] else {
                print("Error in placemarks")
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
}
