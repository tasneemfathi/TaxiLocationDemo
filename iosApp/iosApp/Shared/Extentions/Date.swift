//
//  Date.swift
//  sunset
//
//  Created by tasneem .. on 07/03/2023.
//

import Foundation

extension Date{
    func with(format: String) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.amSymbol =  "AM"
            formatter.pmSymbol =  "PM"
            formatter.locale = Locale(identifier: "en")
            return formatter.string(from: self)
        }
}
