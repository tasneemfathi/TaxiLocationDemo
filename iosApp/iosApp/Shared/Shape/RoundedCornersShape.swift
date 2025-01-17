//
//  RoundedCornersShape.swift
//  Wanasa
//
//  Created by tasneem .. on 10/03/2023.
//

import Foundation
import SwiftUI


struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

