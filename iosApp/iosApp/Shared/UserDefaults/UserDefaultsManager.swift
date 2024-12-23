//
//  UserDefaultsManager.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 19/09/2022.
//

import Foundation
import UIKit

class UserDefaultsManager {
    
    @UserDefault("isFirstLaunch", defaultValue: true)
    static var isFirstLaunch: Bool
   
    @UserDefault("isLocationGranted", defaultValue: false)
    static var isLocationGranted: Bool

    @UserDefault("selectedLanguage", defaultValue: "ar")
    static var selectedLanguage: String
        
//
//    @UserDefault("isLoggedIn", defaultValue: false)
//    static var isLoggedIn: Bool
//
//    @UserDefault("currentUser", defaultValue: nil)
//    static var currentUser: User?
//
//
//    @UserDefault("addresses", defaultValue: [])
//    static var addresses: [Address]
//
//    @UserDefault("currentLocation", defaultValue: nil)
//    static var currenLocation: LocaleUserLocation?
//
//   
//    @UserDefault("user-token", defaultValue: "")
//    static var token: String?
//     
//    @UserDefault("config", defaultValue: nil)
//    static var config: Configurations?
//
//   @UserDefault("payments", defaultValue: [])
//   static var payments: [Payment]
//
//    @UserDefault("cities", defaultValue: [])
//    static var cities: [City]
//
//    @UserDefault("sizes", defaultValue: [])
//    static var sizes: [Property]
//
//    @UserDefault("isGrid", defaultValue: true)
//    static var isGrid: Bool
//
//    @UserDefault("colors", defaultValue: [])
//    static var colors: [Property]
//
//    @UserDefault("properties", defaultValue: [])
//    static var properties: [Property]
    
@propertyWrapper
    struct UserDefault<T: Codable> {
        let key: String
        let defaultValue: T

        init(_ key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }

        var wrappedValue: T {
            get {
                guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                    return defaultValue
                }
                let value = try? JSONDecoder().decode(T.self, from: data)
                return value ?? defaultValue
            }
            set {
                let data = try? JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: key)
            }
        }
    }
}


