//
//  WelcomeRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol WelcomeRoutingLogic: class {
    func routeToDashboard(viewModel: Welcome.Login.ViewModel)
}

protocol WelcomeDataPassing: class {
    var dataStore: WelcomeDataStore? { get }
}

class WelcomeRouter: WelcomeRoutingLogic, WelcomeDataPassing {
    
    weak var welcomeVC: WelcomeViewController?
    
    var dataStore: WelcomeDataStore?

    func navigateToDashboard(source: WelcomeViewController, destination: DashboardViewController) {
        source.show(destination, sender: nil)
    }

    func passDataToDashboard(source: WelcomeDataStore, destination: inout DashboardDataStore) {
        guard let store = dataStore, let name = store.name else {
            print("Error passing name property")
            return
        }
        destination.profile = Profile(name: name, image: nil)
    }
    
    func routeToDashboard(viewModel: Welcome.Login.ViewModel) {
        dataStore?.name = viewModel.name
        let dashboardVC = DashboardViewController()
        guard let destinationRouter = dashboardVC.router, var destinationDS = destinationRouter.dataStore, let sourceDataStore = dataStore else {
            return }
        passDataToDashboard(source: sourceDataStore, destination: &destinationDS)
        guard let currentVC = welcomeVC else { return }
        navigateToDashboard(source: currentVC, destination: dashboardVC)
    }
}

