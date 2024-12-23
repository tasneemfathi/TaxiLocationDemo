//
//  ReusableRateView.swift
//  sunset
//
//  Created by tasneem .. on 20/03/2023.
//

import Foundation
import SwiftUI


struct RatingBar:View{
     var rating:Int
     var fullCount:Int = 5
     var width: CGFloat = 14
     var height: CGFloat = 14
     var body: some View {
        HStack(spacing: 0){

            ForEach(1..<fullCount + 1, id:\.self){number in
                Image("star")
                    .resizable()
                    .frame(width: width,height: height)
                    .foregroundColor(number>rating ? .gray : .yellow)
                        .padding(.leading, 3)


                              }
                      }
        }
}

struct RatingBarDragabble:View{
     @Binding var rating:Int
     var fullCount:Int = 5
     var width: CGFloat = 21
     var height: CGFloat = 21
     var body: some View {
        HStack(spacing: 0){

            ForEach(1..<fullCount + 1, id:\.self){number in
                Image("star")
                    .resizable()
                    .frame(width: width,height: height)
                    .foregroundColor(number>(rating) ? .gray  : .yellow)
                        .padding(.leading, 5)
                              .onTapGesture {
                                      self.rating = number

                                  }
                              }
                      }
        }
    }

