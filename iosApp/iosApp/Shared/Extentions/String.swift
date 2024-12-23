//
//  String.swift
//  sunset
//
//  Created by Mohammed Safadi Macbook Pro on 24/02/2023.
//

import Foundation
import UIKit

extension String {
    
    init(localizedFormate: String, _ arguments: CVarArg...) {
        self.init(format: localizedFormate.localized(), arguments)
    }
    
 
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
    
    func localized() -> String{
        let path = Bundle.main.path(forResource: UserDefaultsManager.selectedLanguage, ofType: "lproj")
           let bundle = Bundle(path: path!)
           return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }

    func getDate(with format: String) -> Date? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           dateFormatter.amSymbol = "AM"
           dateFormatter.pmSymbol = "PM"
           dateFormatter.locale = Locale(identifier: "en_US")
           dateFormatter.timeZone = TimeZone.current
           return dateFormatter.date(from: self)
       }
    func isValidUrl() -> Bool {
            if let url = NSURL(string: self) {
                return UIApplication.shared.canOpenURL(url as URL)
            }else{
                return false
            }
    }

    func replaceSimilarStrings() -> String{
        var newStr = self
        if(self.hasPrefix("ال") || self.hasPrefix("al")){
            newStr = self.dropFirst(2).base
        }
        newStr = newStr.replacingOccurrences(of : "ه", with: "ة").replacingOccurrences(of : "إ", with: "ا").replacingOccurrences(of : "ى", with: "ي").replacingOccurrences(of: "أ" , with: "ا")
        return newStr
    }


    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
