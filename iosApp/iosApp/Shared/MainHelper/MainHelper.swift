//
//  MainHelper.swift
//  BaseSwiftUI2022
//
//  Created by Mohammed Safadi Macbook Pro on 03/02/2023.
//

import UIKit
import SwiftMessages
import IQKeyboardManagerSwift

class MainHelper {
    static let shared = MainHelper()
        
    private init() {
     //   SwiftMessages.defaultConfig.duration = .seconds(seconds: 7)
      //  SwiftMessages.defaultConfig.presentationContext = .window(windowLevel: .normal)
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

    public func showNoticeMessage(_ message: String) {
        guard message.count > 0 else { return }
        
        let noticView = getMessageView(theme: .warning)
        configureContent(messageView: noticView, content: message)
        
        DispatchQueue.main.async {
            SwiftMessages.show(view: noticView)
        }
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
    
    private func configureContent(messageView: MessageView, content: String) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        messageView.bodyLabel?.attributedText = NSAttributedString(string: content, attributes: [.paragraphStyle: style])
    }

    
    public func changeLanguageToEnglish() {
           if !L102Language.isRTL { return }
           
           let transition: UIView.AnimationOptions = .transitionFlipFromRight
           L102Language.setAppleLAnguageTo(lang: "en")
           UserDefaultsManager.selectedLanguage = "en"
           UIView.appearance().semanticContentAttribute = .forceLeftToRight

       }

       public func changeLanguageToArabic() {
           if L102Language.isRTL { return }

           let transition: UIView.AnimationOptions = .transitionFlipFromLeft
           L102Language.setAppleLAnguageTo(lang: "ar")
           UserDefaultsManager.selectedLanguage = "ar"
           UIView.appearance().semanticContentAttribute = .forceRightToLeft

       }

    
}
