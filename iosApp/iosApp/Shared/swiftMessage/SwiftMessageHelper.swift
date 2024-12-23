//
//  SwiftMessageHelper.swift
//  iosApp
//
//  Created by tasneem .. on 22/12/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages


class SwiftMessageHelper{
    static let shared = SwiftMessageHelper()

    private init() {
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 7)
        SwiftMessages.defaultConfig.presentationContext = .window(windowLevel: .normal)
    }

    public func showErrorMessage(_ error: Error) {

        let errorView = getMessageView(theme: .error)
        configureContent(messageView: errorView, content: error.localizedDescription)

        DispatchQueue.main.async {
            SwiftMessages.show(view: errorView)
        }
    }

    public func showErrorMessage(_ error: String) {

        let errorView = getMessageView(theme: .error)
        configureContent(messageView: errorView, content: error)

        DispatchQueue.main.async {
            SwiftMessages.show(view: errorView)
        }
    }
    public func showSuccessMessage(_ message: String) {
        guard message.count > 0 else { return }

        let successView = getMessageView(theme: .success)
        configureContent(messageView: successView, content: message)

        DispatchQueue.main.async {
            SwiftMessages.show(view: successView)
        }
    }
}
private func configureContent(messageView: MessageView, content: String) {
    let style = NSMutableParagraphStyle()
    style.lineSpacing = 5

    messageView.bodyLabel?.attributedText = NSAttributedString(string: content, attributes: [.paragraphStyle: style])
}

private func getMessageView(theme: Theme) -> MessageView {
    let view = MessageView.viewFromNib(layout: .messageView)

    view.configureTheme(theme)
    view.iconImageView?.isHidden = true
    view.button?.isHidden = true
    view.titleLabel?.isHidden = true
    view.iconLabel?.isHidden = true

    return view
}
