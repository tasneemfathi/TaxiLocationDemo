//
//  TextModifer.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 26/12/2022.
//

import Foundation
import SwiftUI

struct Regular:ViewModifier {
    var size:CGFloat
    var color: Color = Color.black

    func body(content: Content) -> some View {
        content
            .font(.AppRegularFont(size: size))
            .foregroundColor(color)
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)

     }
}

struct Medium:ViewModifier {
    var size:CGFloat
    var color: Color = Color.black

    func body(content: Content) -> some View {
        content
            .font(.AppMediunFont(size: size))
            .foregroundColor(color)
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)

     }
}

struct Bold:ViewModifier {
    var size:CGFloat
    var color: Color = Color.black

    func body(content: Content) -> some View {
        content
            .font(.AppBoldFont(size: size))
            .foregroundColor(color)
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)

     }
}


struct Light:ViewModifier {
    var size:CGFloat
    var color: Color = Color.black

    func body(content: Content) -> some View {
        content
            .font(.AppLightFont(size: size))
            .foregroundColor(color)
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)

     }
}

