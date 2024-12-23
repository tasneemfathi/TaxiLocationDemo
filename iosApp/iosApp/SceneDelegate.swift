//
//  SceneDelegate.swift
//  Bedaati
//
//  Created by Mohammed Safadi Macbook Pro on 07/05/2023.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {

    var window: UIWindow?
    let appContainers = AppContainers()
    var appCoordinators: AppCoordinators?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        window?.rootViewController = UIHostingController(rootView: SplashView(actionOnFinish: configureRoot)
            .modifier(LanguageModifier()))
        // add delay to ensure that main view is loaded
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            if let userActivity = connectionOptions.userActivities.first {
                if let incomingURL = userActivity.webpageURL {

                }
            }
        }
        window?.makeKeyAndVisible()
        print("SceneDelegate is connected!")
    }


    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        print("url: \(userActivity.webpageURL!)")
       
    }


    func configureRoot() {
        let navigationController = AppNavigation()
        appCoordinators = AppCoordinators(navigationController: navigationController, appContainers: appContainers)
        appCoordinators?.startApp()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }



}
