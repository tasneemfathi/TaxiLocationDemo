//
//  LocalizedStringKey.swift
//  sunset
//
//  Created by Mohammed Safadi Macbook Pro on 24/02/2023.
//

import Foundation
import SwiftUI

extension LocalizedStringKey {
    var stringKey: String? {
            Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
        }

    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey ?? "key", locale: locale)
    }



    public func toString() -> String {
        //use reflection
        let mirror = Mirror(reflecting: self)

        //try to find 'key' attribute value
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }


        if(attributeLabelAndValue != nil) {
            //ask for localization of found key via NSLocalizedString
            let language = UserDefaultsManager.selectedLanguage
            let path = Bundle.main.path(forResource: language, ofType: "lproj")
            let bundle = Bundle(path: path!)
            return bundle?.localizedString(forKey: attributeLabelAndValue!.value as! String, value: nil, table: nil) ?? ""

        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}
