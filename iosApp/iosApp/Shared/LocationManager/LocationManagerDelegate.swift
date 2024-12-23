//
//  LocationManagerDelegate.swift
//  iosApp
//
//  Created by tasneem .. on 21/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import CoreLocation

let apikey = "AIzaSyD5agk-ezvFVOV0D7Orur41xHHjlj9DDjk"

class  MyLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
     var locationManager: CLLocationManager

    @Published var location: CLLocationCoordinate2D?
    @Published var currentUserLocation: CLLocationCoordinate2D?

    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager didUpdateLocations")
        guard let newLocation = locations.last else { return }
        self.currentUserLocation = newLocation.coordinate
        self.location = newLocation.coordinate
        self.locationManager.stopUpdatingLocation()


    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
