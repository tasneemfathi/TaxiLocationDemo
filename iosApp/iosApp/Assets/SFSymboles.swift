//
//  SFSymboles.swift
//  sunset
//
//  Created by Mohammed Safadi Macbook Pro on 09/02/2023.
//

import SwiftUI

enum SFSymbols:String,View,CaseIterable{
        
    case home = "house"
    case account = "person"
    case phone = "phone"
    case chat = "bubble.right"
    case code = "number"
    case settings = "square.grid.3x3"
    case notification = "bell"
    case notificationFill = "bell.fill"
    case language = "character.bubble"
    case arrow = "chevron.forward"
    case arrowBack = "chevron.backward"
    case dropDown = "chevron.down"
    case edit = "pencil.and.ellipsis.rectangle"
    case share = "square.and.arrow.up"
    case delete = "trash"
    case arrow_left = "arrow.backward"
    case arrow_left_circle = "arrow.backward.circle"
    case arrow_right = "arrow.right"
    case forward = "arrow.forward"
    case done = "checkmark.circle"
    case checkmark = "checkmark.circle.fill"
    case updown = "chevron.up.chevron.down"
    case check = "checkmark"
    case star = "star"
    case starFill = "star.fill"
    case email = "at"
    case close = "xmark"
    case heart = "heart"
    case cart = "cart"
    case support = "person.crop.circle.badge.exclamationmark"
    case search = "magnifyingglass"
    case lock = "lock"
    case plus = "plus"
    case minus = "minus"
    case list = "list.bullet"
    case grid = "circle.grid.3x3"
    case warning = "exclamationmark.triangle.fill"
    case orders = "list.bullet.rectangle.portrait"
    case info = "info"
    case logout = "rectangle.portrait.and.arrow.right"
    case comment = "text.bubble"
    case receive = "cube.box"
    case calendar = "calendar"
    case truck = "box.truck"
    case bill = "newspaper"
    case money = "creditcard"
    case discount = "percent"
    case circleWarning = "exclamationmark.circle.fill"
    case dollar = "dollarsign.circle"

    var body: some View {
        Image(systemName: rawValue)
            .frame(width: 28, height: 28, alignment: .center)
            .contentShape(Rectangle())
    }
    
    
}

