//
//  MainContainer.swift
//  Bedaati
//
//  Created by tasneem .. on 06/06/2023.
//

import SwiftUI

class MainContainer:ObservableObject{

        func makeFlowCoordinator(navigationController:  AppNavigation) -> MainCoordinator {
            return MainCoordinator(navigationController: navigationController, dependencies: self)
        }

    func makeMainView(mainCoordinator: MainCoordinator,index:Int = 0) -> UIViewController {
        let vc = ContentView(mainCoordinator: mainCoordinator)
            .modifier(LanguageModifier())
            .modifier(NavigationVisiblityModifier(isHidden: false))

        return DarkHostingController(rootView: vc)
    }
}
