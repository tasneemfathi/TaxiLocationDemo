//
//  Double.swift
//  sunset
//
//  Created by tasneem .. on 07/03/2023.
//

import Foundation

extension Double {
    func toPrice() -> String{
        return CustomNumberFormatter.formatNumToPrice(self)
    }
    func toDecimal() -> String{
        return CustomNumberFormatter.formatNumToDecimal(self)
    }
}
