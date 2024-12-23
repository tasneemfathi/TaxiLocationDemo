//
//  Optional.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 19/12/2022.
//

import Foundation
import Combine

 
extension Optional where Wrapped == String {
    var emptyIfNull: String {
        return self ?? ""
    }
}


extension Optional where Wrapped == Int {
    var zeroIfNull: Int {
        return self ?? 0
    }
}

extension Optional where Wrapped == Double {
    var doubleIfNull: Double {
        return self ?? 0.0
    }
}

