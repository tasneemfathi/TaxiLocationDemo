//
//  SplashView.swift
//  Bedaati
//
//  Created by Mohammed Safadi Macbook Pro on 07/05/2023.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    @State var size = 0.1
    @State var opacity = 0.1
    var actionOnFinish: () -> Void

    var body: some View {
            ZStack {
                Rectangle()
                    .fill( LinearGradient(gradient: Gradient(colors: [ColorResource.appPrimary.color(), ColorResource.gradientSecond.color()]), startPoint: .top, endPoint: .bottom)
                    ).ignoresSafeArea()


                VStack{
                    Image(ImageResource.logo)
                }
                .opacity(opacity)
                .scaleEffect(size)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity  = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    actionOnFinish()
                }
            
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView{

        }
    }
}
