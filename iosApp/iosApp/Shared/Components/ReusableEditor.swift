//
//  ReusableEditor.swift
//  TakeefApp
//
//  Created by tasneem .. on 08/01/2023.
//

import Foundation
import SwiftUI



struct ReusableEditor: View {
    enum FocusField: Hashable {
       case field
     }

     @FocusState private var focusedField: FocusField?

    var placeholder: String
    @Binding var field: String
    @State var isGray: Bool = true
    @State var isChat: Bool = false
    var isDisabled : Bool = false
    @State var onSubmit : (String) -> ()

    
    var body: some View {
        VStack(alignment: .leading) {

            HStack {

                TextEditor(text: $field)
                    .font(Font.AppRegularFont(size: 14))
                    .foregroundColor(.black)
                    .disabled(isDisabled)
                    .focused($focusedField, equals: .field)
                    .overlay (alignment: .topLeading , content: {
                        HStack(alignment: .center) {
                            if field.isEmpty {
                                Text(LocalizedStringKey(placeholder))
                                    .modifier(Regular(size: 12, color: .gray.opacity(0.23)))
                                    .zIndex(5)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 15)
                                    .onTapGesture {
                                        focusedField = .field
                                    }
                            }
                        }.frame(maxWidth: .infinity,minHeight: 45 , alignment: .leading)

                    })
                    .submitLabel(.return)
                    .frame(minHeight: 45)
                    .lineSpacing(10)
                    .ignoresSafeArea(.keyboard,edges: .bottom)
                    .modifier(EditorBackgroundModifier())
                    .onAppear{
                        UITextView.appearance().textContainerInset =
                             UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
                    }

            }
            .autocapitalization(.none)
            .padding(.horizontal , 12)
            .background{
                if(isChat){
                    Capsule()
                        .foregroundColor(.white)
                }else{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(isGray ? Color.gray.opacity(0.1) : Color.green, lineWidth: 1)
                        }
                }
            }
            .frame(maxWidth: .infinity,minHeight: isChat ? 55 : 85 , alignment: .leading)
         }.ignoresSafeArea(.keyboard , edges: .bottom)

    }
}

struct EditorBackgroundModifier:ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
                .background(.clear)
        }else{
            content
                .onAppear{
                    UITextView.appearance().backgroundColor = UIColor.clear

                }
        }
    }
}


struct ReusableEditor_Previews: PreviewProvider {
    static var previews: some View {
        ReusableEditor(placeholder: "", field: .constant("")) { String in
        }
    }
}
