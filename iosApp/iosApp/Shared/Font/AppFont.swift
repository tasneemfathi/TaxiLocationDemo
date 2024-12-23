//
//  AppFont.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 19/09/2022.
//

import Foundation
import SwiftUI

struct AppFontName {
    static let Regular      = "ExpoArabic-Book"
    static let Medium       = "ExpoArabic-Medium"
    static let Bold         = "ExpoArabic-Bold"
    static let Light        = "ExpoArabic-Light"

}

extension Font {

    static func AppBoldFont(size: CGFloat) -> Font {
        return .custom( AppFontName.Bold, size: size)
    }

    static func AppMediunFont(size: CGFloat) -> Font {
        return .custom( AppFontName.Medium, size: size)
    }
    static func AppRegularFont(size: CGFloat) -> Font {
        return .custom(AppFontName.Regular, size: size)
    }
    
    static func AppLightFont(size: CGFloat) -> Font {
        return .custom(AppFontName.Light, size: size)
    }


 
}
