//
//  AppAsyncImage.swift
//  AsynImageLab
//
//  Created by tasneem .. on 24/12/2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ReusableAsyncImage : View {

    @State var currentUrl : String?
    private var url : String
    private var contentMode : ContentMode
    @State var isValid : Bool

    init(url:String, contentMode:ContentMode){
        self.url = url
        self.contentMode = contentMode
        self.isValid = url.isValidUrl() == true
    }

    var body : some View{

        if(isValid){
            WebImage(url: URL(string: url)){ image in
                image
                    .resizable()
                    .transition(.fade(duration: 0.5))
                    .aspectRatio(contentMode: contentMode)

            } placeholder: {
                Image("holder")
                     .resizable()
                     .aspectRatio(contentMode: contentMode)
            }


        }else{
            Image("holder")
                .resizable()
                .aspectRatio(contentMode: contentMode)
        }
    }

    


}
