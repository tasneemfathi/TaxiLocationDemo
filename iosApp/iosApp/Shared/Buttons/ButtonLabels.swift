//
//  ButtonLabels.swift
//  Bedaati
//
//  Created by tasneem .. on 07/06/2023.
//

import Foundation
import SwiftUI

struct ButtonLabel : View{

    let title : String
    let color : Color
    let fgColor : Color
    let size : CGFloat
    let height : CGFloat
    let icon : SFSymbols?
    @Binding var isLoading : Bool
    @Binding var isEnabled : Bool

    init(title: String ,icon: SFSymbols? = nil ,color:Color = ColorResource.appPrimary.color(),fgColor:Color = .white,size:CGFloat = 16,height:CGFloat = 45,isEnabled:Binding<Bool> = Binding.constant(true), isLoading:Binding<Bool> = Binding.constant(false)){
        self.title = title
        self.icon  = icon
        self.color = color
        self.fgColor = fgColor
        self.size  = size
        self.height  = height
        self._isLoading =  isLoading
        self._isEnabled =  isEnabled
    }

    var body: some View {
        HStack{
            if(icon != nil){
                icon
                .foregroundColor(.white)
            }
            Text(LocalizedStringKey(title))
                .asSingleLine()
                .modifier(Regular(size: size, color: fgColor))
        }
        .modifier(ButtonModifier(color: color, height: height,isEnabled: $isEnabled, isLoading: $isLoading))
    }
}
