//
//  ButtonModifier.swift
//  TakeefApp
//
//  Created by tasneem .. on 29/12/2022.
//

import Foundation
import SwiftUI

struct ButtonModifier : ViewModifier{
    var color: Color
    @Binding var isLoading : Bool
    @Binding var isEnabled : Bool
    @State var height : CGFloat

    init(color: Color = ColorResource.appPrimary.color(), height : CGFloat = 50, isEnabled:Binding<Bool> = Binding.constant(true), isLoading:Binding<Bool> = Binding.constant(false)){
        self.color = color
        self._isLoading =  isLoading
        self._isEnabled =  isEnabled
        self.height =  height
    }

    func body(content: Content) -> some View {
            ZStack{
                if(isLoading){
                    ProgressView()
                }else{
                    content
                        .modifier(Regular(size: 16, color: Color.black))
                        .frame(maxWidth: .infinity, minHeight: height)
                        .padding(.bottom, 4)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, minHeight: height)
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(color)
            }
            .cornerRadius(5)
            .padding(.vertical ,5)
            .opacity(isEnabled ? 1 : 0.5)
            .disabled(isLoading || !isEnabled)
    }
}

struct ButtonNoSizeModifier : ViewModifier{
    var color: Color
    @Binding var isLoading : Bool
    @Binding var isEnabled : Bool

    init(color: Color = ColorResource.appPrimary.color(), isEnabled:Binding<Bool> = Binding.constant(true), isLoading:Binding<Bool> = Binding.constant(false)){
        self.color = color
        self._isLoading =  isLoading
        self._isEnabled =  isEnabled
    }

    func body(content: Content) -> some View {
            ZStack{
                if(isLoading){
                    ProgressView()
                }else{
                    content
                        .modifier(Regular(size: 16, color: Color.black))
                        .padding(.bottom, 4)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(color)
            }
            .cornerRadius(5)
            .padding(.vertical ,5)
            .opacity(isEnabled ? 1 : 0.5)
            .disabled(isLoading || !isEnabled)
    }
}

struct ButtonBorderedModifier : ViewModifier{
    var color: Color
    @Binding var isLoading : Bool
    @Binding var isEnabled : Bool

    init(color: Color = ColorResource.appPrimary.color(), isEnabled:Binding<Bool> = Binding.constant(true), isLoading:Binding<Bool> = Binding.constant(false)){
        self.color = color
        self._isLoading =  isLoading
        self._isEnabled =  isEnabled
    }

    func body(content: Content) -> some View {
        ZStack(alignment: .center){
            if(isLoading){
                ProgressView()
            }
                content
                .foregroundColor(isLoading ? Color.clear : color)
                .modifier(Regular(size: 16, color:isLoading ? Color.clear : color))
                .padding(.bottom, 4)

            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 1)
            }
            .padding(.vertical ,5)
            .opacity(isEnabled ? 1 : 0.5)
            .disabled(isLoading || !isEnabled)
    }
}

