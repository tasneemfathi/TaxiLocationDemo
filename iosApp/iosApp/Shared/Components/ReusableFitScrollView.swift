//
//  ReusableFitScrollView.swift
//  ViewStores
//
//  Created by tasneem .. on 29/03/2023.
//

import SwiftUI

struct ReusableFitScrollView<Content:View>: View {
    @State private var contentSize: CGSize = .zero
    let content:Content

    init(@ViewBuilder content: () -> Content) {
        self.content        = content()

    }
    var body: some View {
        ScrollView (showsIndicators: false){
            ZStack(alignment: .center) {
                VStack(alignment: .center ,spacing: 10 ) {
                    content
                }
            }.overlay(
                        GeometryReader { geo in
                            Color.red.onAppear {
                                contentSize = geo.size
                            }
                        }
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: contentSize.height)
        
    }
}

struct ReusableFitScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableFitScrollView{}
    }
}
