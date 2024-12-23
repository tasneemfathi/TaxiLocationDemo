//
//  Shared.swift
//  AshalUser
//
//  Created by tasneem .. on 23/11/2022.
//

import Foundation

class CustomNumberFormatter {

    static func formatNumToPrice(_ price:Double) -> String{
        let locale = Locale(identifier: "es_ES")
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .decimal
        numberFormatter.decimalSeparator = "."
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        return numberFormatter.string(from:   NSNumber(value: price)) ?? ""
    }

    static func formatNumToPrice(_ price:Int) -> String{
        let locale = Locale(identifier: "es_ES")
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from:   NSNumber(value: price)) ?? ""
    }
    static func formatNumToRate(_ rate:Double) -> String{
        let locale = Locale(identifier: "es_ES")
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "."
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1

        return numberFormatter.string(from: NSNumber(value: rate)) ?? ""
    }

    static func formatNumToDecimal(_ num :Int) -> String{
        let locale = Locale(identifier: "es_ES")
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.numberStyle = .none
        return numberFormatter.string(from:   NSNumber(value: num)) ?? ""
    }
    static func formatNumToDecimal(_ num :Double) -> String{
        let locale = Locale(identifier: "es_ES")
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.numberStyle = .none
        return numberFormatter.string(from:   NSNumber(value: num)) ?? ""
    }

}
