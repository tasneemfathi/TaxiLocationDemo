//
//  UIApplication.swift
//  sunset
//
//  Created by Mohammed Safadi Macbook Pro on 09/02/2023.
//

import UIKit

extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }

    static var release: String {
          return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "x.x"
      }
      static var build: String {
          return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String? ?? "x"
      }
      static var version: String {
          return "\(release).\(build)"
      }
}
