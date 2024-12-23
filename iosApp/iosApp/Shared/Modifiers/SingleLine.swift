//
//  SingleLine.swift
//  ViewStores
//
//  Created by tasneem .. on 29/03/2023.
//

import Foundation
import SwiftUI

struct SingleLineModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)

    }
}

extension Text{
    func asSingleLine() -> some View{
      return self.modifier(SingleLineModifier())
    }
}
