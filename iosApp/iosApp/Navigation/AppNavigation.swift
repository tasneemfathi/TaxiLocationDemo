//
//  AppNavigation.swift
//  Bedaati
//
//  Created by Mohammed Safadi Macbook Pro on 07/05/2023.
//

import UIKit
import SwiftUI

class AppNavigation: UINavigationController, UINavigationControllerDelegate {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(named: "AppPrimaryColor")
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.titleTextAttributes      = [.foregroundColor: UIColor.white ]
        appearance.largeTitleTextAttributes = [.font           : UIFont(name: "ExpoArabic-Medium", size: 16)!,.foregroundColor: UIColor.white]
        appearance.titleTextAttributes      = [.font           : UIFont(name: "ExpoArabic-Medium", size: 16)!,.foregroundColor: UIColor.white]

        let barButtonAppearance = UIBarButtonItemAppearance()
         barButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear ]

        appearance.backButtonAppearance = barButtonAppearance
        let backImage = UIImage(systemName: "chevron.left")?.withTintColor(UIColor.white)
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
        navigationBar.tintColor = UIColor.white

      //  navigationBar.prefersLargeTitles = true
      //  navigationItem.largeTitleDisplayMode = .automatic

        delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backButtonDisplayMode = .minimal
    }

 }

class DarkHostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

}

class LightHostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }


}

