//
//  ReusableTextFeild.swift
//  BaseSwiftUI2022
//
//  Created by i mac on 26/12/2022.
//

import SwiftUI

struct ReusableTextFeild: View {
    var symbol: SFSymbols? = nil
    var placeholder: String
    @Binding var field: String
    var keyboardType : UIKeyboardType = .default
    var isSecure = false
    var isMobile = false

    var isDisabled : Bool = false
    @State var isHidden = true

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if(symbol != nil){
                    symbol
                        .foregroundColor(.gray)
                        .frame(width: 20)
                        .padding(.trailing, 15)
                }
                if isSecure  && isHidden{
                    SecureField(text: $field) {
                        Text(LocalizedStringKey(placeholder))
                            .asSingleLine()
                            .modifier(Regular(size: 12, color: .gray))
                    }
                    .frame(height: 48)
                    .modifier(Regular(size: 12))
                } else {
                    HStack(alignment: .center) {
                        TextField(text: $field) {
                            Text(LocalizedStringKey(placeholder))
                                .asSingleLine()
                                .modifier(Regular(size:12, color: .gray.opacity(0.5)))
                        }
                       // .minimumScaleFactor(0.5)
                        .modifier(Regular(size: 12, color: .black))
                        .keyboardType(keyboardType)
                        .disabled(isDisabled)

                        if(isMobile){
                            Rectangle()
                                .foregroundColor(.white.opacity(0.4))
                                .frame(width: 1, height: 20)
                                .padding(.horizontal, 10)

                            Text("966")
                                .modifier(Regular(size: 14, color: .gray))
                        }
                    }
                }
                if(isSecure){
                    Button(action: {
                        isHidden.toggle()
                    }) {
                        Image(systemName: self.isHidden ? "eye.slash" : "eye")
                            .resizable()
                            .accentColor(.gray)
                            .padding(2)
                            .frame(width: 24, height: 20)
                            .zIndex(5)
                    }
                }
            }
            .autocapitalization(.none)
            .padding(.horizontal , 18)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background{
                    RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(isDisabled ? Color.gray.opacity(0.1) : Color.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        }

            }


         }
    }
}

struct ReusableTextFeild_Previews: PreviewProvider {
    static var previews: some View {
        ReusableTextFeild(symbol: .account, placeholder: "Email Address", field: .constant(""))
    }
}
 
