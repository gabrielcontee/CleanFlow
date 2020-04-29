//
//  DashboardRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardDataPassing {
    var dashboardDataStore: DashboardDataStore? { get }
}

protocol DashboardRoutingLogic: class {
    func routeToNewObject(userObjects: [String])
}

class DashboardRouter: DashboardDataPassing, DashboardRoutingLogic {
    
    weak var dashboardVC: DashboardViewController?
    
    var dashboardDataStore: DashboardDataStore?
    
    func routeToNewObject(userObjects: [String]) {
        let newObjectVC = NewObjectViewController()
        
        guard let router = newObjectVC.router, var destinationDS = router.newObjectDataStore, let sourceDS = dashboardDataStore, let sourceVC = dashboardVC else {
            return
        }
        
        passDataToAddObject(source: sourceDS, destination: &destinationDS)
        navigateToNewObject(source: sourceVC, destination: newObjectVC)
    }
    
    func navigateToNewObject(source: DashboardViewController, destination: NewObjectViewController) {
        source.show(destination, sender: nil)
    }
    
    func passDataToAddObject(source: DashboardDataStore, destination: inout NewObjectDataStore) {
        guard let store = dashboardDataStore else {
            print("Error passing name property")
            return
        }
        destination.currentObjects = store.userObjects
    }
}
