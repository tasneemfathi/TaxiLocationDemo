//
//  MainCoordinator.swift
//  Bedaati
//
//  Created by tasneem .. on 06/06/2023.
//

import SwiftUI
import UIKit


class MainCoordinator:ObservableObject {

    var navigationController: AppNavigation?
    let dependencies: MainContainer

   // var switchToAuthFlowCoordinator: ((_ authStart: AuthStart) -> Void)?

    init(navigationController: AppNavigation, dependencies: MainContainer) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }


    func startCoordinator(){
//        if(UserDefaultsManager.isFirstLaunch){
//            startIntroView()
//        }else  if(!UserDefaultsManager.isLocationGranted){
//            startLocationPermission()
//        }else{
            let vc = dependencies.makeMainView(mainCoordinator: self)
            navigationController?.viewControllers = [vc]
      //  }
    }


    func pushRoot(){
       startCoordinator()
    }
    func pushRootWithIndex(index:Int){
        let vc = dependencies.makeMainView(mainCoordinator: self, index: index)
        navigationController?.viewControllers = [vc]
    }
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    func dismiss() {
        navigationController?.presentedViewController?.dismiss(animated: true)
    }

    static let Example = MainCoordinator.init(navigationController: AppNavigation.init(), dependencies: MainContainer())

}


