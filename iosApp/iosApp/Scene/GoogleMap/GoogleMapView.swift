//
//  GoogleMapView.swift
//  iosApp
//
//  Created by tasneem .. on 21/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import GoogleMaps
import shared

struct GoogleMapView: UIViewRepresentable {
    @EnvironmentObject var locationManager: MyLocationManager
    @Binding var currentStep: TripStep
    @Binding var pickLocation: (Double, Double)
    @Binding var dropLocation: (Double, Double)
    @Binding var directions: [LatLng]
    @Binding var location: CLLocationCoordinate2D?
    @Binding var reset: Bool
    let onMapIdle: (CLLocationCoordinate2D) -> Void

    func makeUIView(context: Context) -> GMSMapView {

        let camera = GMSCameraPosition.camera(withLatitude: location?.latitude ?? 24.7136, longitude: location?.longitude ?? 46.6753, zoom: 16)
        let mapView = GMSMapView()
        mapView.frame = .zero
        mapView.camera = camera
        mapView.delegate = context.coordinator
        mapView.isMyLocationEnabled = true
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
            uiView.clear()



             if !directions.isEmpty {
                  let path = GMSMutablePath()

                  // Convert directions (LatLng) into GMSMutablePath
                  for latLng in directions {
                      path.add(CLLocationCoordinate2D(latitude: latLng.latitude, longitude: latLng.longitude))
                  }

                  let polyline = GMSPolyline(path: path)
                  polyline.strokeColor = .red // Set the color of the polyline
                  polyline.strokeWidth = 6.0 // Set the width of the polyline
                  polyline.map = uiView
             }
            if currentStep.value > TripStep.pick.value {
               let marker = GMSMarker()
               marker.position = CLLocationCoordinate2D(latitude: pickLocation.0, longitude: pickLocation.1)
               marker.title = "Pick Location"
                var markerIcon = UIImage(named: "marker-svgrepo-com")
                markerIcon = markerIcon?.tinted(with: UIColor(resource:ColorResource.appPrimary))
               marker.icon = markerIcon
               marker.map = uiView
            }

            if currentStep.value > TripStep.drop.value {
               let marker = GMSMarker()
               marker.position = CLLocationCoordinate2D(latitude: dropLocation.0, longitude: dropLocation.1)
               marker.title = "Drop Location"
               var markerIcon = UIImage(named: "marker-svgrepo-com")
               markerIcon = markerIcon?.tinted(with: UIColor(resource:ColorResource.gradientSecond))
               marker.icon = markerIcon
               marker.map = uiView
            }

            if reset {
                let camera = GMSCameraPosition.camera(withLatitude: locationManager.currentUserLocation?.latitude ?? 0.0, longitude: locationManager.currentUserLocation?.longitude ?? 0.0, zoom: 16)
                uiView.animate(to: camera)
                DispatchQueue.main.async {
                    self.reset = false
                }
            }

     

    }

    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }

    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var parent: GoogleMapView

        init(_ parent: GoogleMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            let newLocation = CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)
            parent.locationManager.location = newLocation
       }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            let currentPosition = CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)
            parent.locationManager.location = currentPosition
            parent.onMapIdle(currentPosition)
        }

        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            print("Marker tapped: \(marker.title ?? "No Title")")
            return true
        }
    }
}
