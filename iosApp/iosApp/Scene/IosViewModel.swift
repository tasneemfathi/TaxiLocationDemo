//
//  IosViewModel.swift
//  iosApp
//
//  Created by tasneem .. on 22/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import shared
import Combine
import Foundation

struct LatLng {
    var latitude: Double
    var longitude: Double
}

class IosViewModel:ObservableObject{
    private var sharedViewModel: SharedViewModel
        private var cancellables = Set<AnyCancellable>()

        @Published var location: GeocodingResponse?
        @Published var directions: [LatLng] = []
        @Published var pickLocation : (Double, Double) = (0.0,0.0)
        @Published var dropLocation : (Double, Double) = (0.0,0.0)
        @Published var pickGeoLocation : String = ""
        @Published var dropGeoLocation : String = ""
        @Published var currentStep : TripStep  = TripStep.pick

        init(sharedViewModel: SharedViewModel) {
            self.sharedViewModel = sharedViewModel
            // Using SKIE to observe the StateFlow as Combine Publisher
            observePublishers()
            observeLocation()
            observeDirections()
        }

        func observePublishers(){
            sharedViewModel.pickLocation
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { pickLocation in
                    self.pickLocation = (pickLocation.first as! Double ,pickLocation.second as! Double)
                })
                .store(in: &cancellables)
            sharedViewModel.dropLocation
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { dropLocation in
                    self.dropLocation = (dropLocation.first as! Double ,dropLocation.second as! Double)
                })
                .store(in: &cancellables)
            sharedViewModel.pickGeoLocation
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { pickGeoLocation in
                    self.pickGeoLocation = pickGeoLocation as! String
                })
                .store(in: &cancellables)
            sharedViewModel.dropGeoLocation
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { dropGeoLocation in
                    self.dropGeoLocation = dropGeoLocation as! String
                })
                .store(in: &cancellables)
            sharedViewModel.currentStep
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { currentStep in
                    self.currentStep = currentStep as! TripStep
                })
                .store(in: &cancellables)
        }

        func observeLocation(){
            sharedViewModel.location
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .failure(let error):
                            // Handle error case
                        SwiftMessageHelper.shared.showErrorMessage(error)
                        case .finished:
                            break
                    }
                }, receiveValue: { [weak self] result in
                    result?.onSuccess(action: { location in
                        self?.location = location as? GeocodingResponse
                        self?.sharedViewModel.updateGeoLocationAddresses(currentGeo: self?.location?.formattedAddress ?? "")
                    }).onError(action: { error, message in
                        SwiftMessageHelper.shared.showErrorMessage(message)
                    })

                })
                .store(in: &cancellables)
        }

        func observeDirections(){
            sharedViewModel.route
                .toPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .failure(let error):
                            // Handle error case
                        SwiftMessageHelper.shared.showErrorMessage(error)
                        case .finished:
                            break
                    }
                }, receiveValue: { [weak self] result in
                    result?.onSuccess(action: { route in
                        self?.directions = (route as? DirectionsResponse)?.directionRoute.map({ pairs in
                            LatLng(latitude: pairs.first as! Double, longitude: pairs.second as! Double)
                        }) ?? []
                    }).onError(action: { error, message in
                        SwiftMessageHelper.shared.showErrorMessage(message)
                    })

                })
                .store(in: &cancellables)
        }

        func fetchLocation(latitude: Double, longitude: Double) {
            sharedViewModel.fetchLocation(latitude: latitude, longitude: longitude)
        }

        func incrementTripStep() {
            sharedViewModel.incrementStep()
        }

        func resetTrip() {
            sharedViewModel.restartTrip()
        }
}

