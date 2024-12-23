//
//  AppCoordinators.swift
//  Bedaati
//
//  Created by tasneem .. on 06/06/2023.
//

import Foundation
import UIKit
import SwiftUI

class AppCoordinators:ObservableObject {

    let navigationController: AppNavigation
    let appContainers: AppContainers

    init(navigationController: AppNavigation, appContainers: AppContainers) {
        self.navigationController = navigationController
        self.appContainers = appContainers
    }

    func startApp(){
       startMainProcees()
    }

//    func startAppDisabled(isUpdate:Bool){
//        startAppDisabledProcess(isUpdate:isUpdate)
//    }


    func startMainProcees(){
        let mainContainer = appContainers.createMainContainer()
        let mainFlow = mainContainer.makeFlowCoordinator(navigationController: navigationController)
        mainFlow.startCoordinator()
//        mainFlow.switchToAuthFlowCoordinator = {[weak self] authStart in
//            UIView.transition(with: (self?.navigationController.view.window)!, duration: 0.55001, options: .transitionFlipFromRight) {
//                self?.startAuthProcess(authStart: authStart)
//            }
//        }
    }

//
//    func startAuthProcess(authStart:AuthStart){
//        let authContainer = appContainers.createAuthContainer()
//        let authFlow = authContainer.makeFlowCoordinator(navigationController: navigationController)
//        authFlow.startCoordinator(authStart: authStart)
//        authFlow.switchToMainFlowCoordinator = { [weak self] in
//            UIView.transition(with: (self?.navigationController.view.window)!, duration: 0.55001, options: .transitionFlipFromRight) {
//                self?.startMainProcees()
//            }
//        }
//
//    }


//    func startAppDisabledProcess(isUpdate:Bool){
//        let mainContainer = appContainers.createMainContainer()
//        let mainFlow = mainContainer.makeFlowCoordinator(navigationController: navigationController)
//        mainFlow.startAppDisabled(isUpdate: isUpdate)
//    }
//
//


}
