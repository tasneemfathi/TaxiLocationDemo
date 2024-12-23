//
//  UIScreen.swift
//  sunset
//
//  Created by tasneem .. on 09/03/2023.
//

import Foundation
import UIKit

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size

    static func isSupportedScreenHeight() -> Bool{
        return screenHeight > 700
    }
}
