//
//  AppDelegate.swift
//  Bedaati
//
//  Created by Mohammed Safadi Macbook Pro on 07/05/2023.
//

import Foundation
import Firebase
import SwiftUI
import IQKeyboardManagerSwift
import GoogleMaps
import shared


@main
class AppDelegate: NSObject, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //FirebaseApp.configure()
        GMSServices.provideAPIKey(apikey)
        setupIQKeyboardManager()
        configureLanguage()
        // Initialize Koin
        KoinInitializer().doInit()
        Messaging.messaging().delegate = self
       // UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })

        application.registerForRemoteNotifications()

        return true
    }



    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
          let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: "SceneConfiguration", sessionRole: connectingSceneSession.role)
          sceneConfig.delegateClass = SceneDelegate.self
          return sceneConfig
      }


    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }
        print(userInfo)
      completionHandler(UIBackgroundFetchResult.newData)
    }

    func configureLanguage() {
        L102Localizer.DoTheMagic()
        L102Language.setAppleLAnguageTo(lang: UserDefaultsManager.selectedLanguage)
      //  UIView.appearance().semanticContentAttribute = .forceRightToLeft

    }

    func setupIQKeyboardManager(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Close"
    }


}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken)
      //  RefreshFCM.fcmToken = fcmToken ?? ""
      //  RefreshFCM.refreshFCM()
    }
}



