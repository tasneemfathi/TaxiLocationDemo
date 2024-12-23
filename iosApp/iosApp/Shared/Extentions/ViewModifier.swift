//
//  ViewModifier.swift
//  sunset
//
//  Created by Mohammed Safadi Macbook Pro on 17/02/2023.
//

import UIKit
import SwiftUI

extension ViewModifier {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }

}
