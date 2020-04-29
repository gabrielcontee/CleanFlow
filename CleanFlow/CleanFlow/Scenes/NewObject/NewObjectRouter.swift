//
//  NewObjectRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/28/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol NewObjectDataPassing {
    var newObjectDataStore: NewObjectDataStore? { get }
}

protocol NewObjectRoutingProtocol {
    func routeToObjectsList()
}

class NewObjectRouter: NewObjectDataPassing, NewObjectRoutingProtocol {
    
    weak var newObjectVC: NewObjectViewController?
    var newObjectDataStore: NewObjectDataStore?
    
    func routeToObjectsList() {
        
        guard let destinationVC = newObjectVC?.navigationController?.getVCinStack(ofClass: DashboardViewController.self) as? DashboardViewController, let newObjDataStore = newObjectDataStore, let router = destinationVC.router, var destinationDataStore = router.dashboardDataStore, let newObjcVC = newObjectVC else {
            return
        }
        passDataToDashboard(source: newObjDataStore, destination: &destinationDataStore)
        navigateToObjectsList(source: newObjcVC, destination: destinationVC)
        destinationVC.requestObjectsRefresh()
    }
    
    func navigateToObjectsList(source: NewObjectViewController, destination: DashboardViewController) {
        source.navigationController?.popToViewController(destination, animated: true)
    }
    
    func passDataToDashboard(source: NewObjectDataStore, destination: inout DashboardDataStore) {
        destination.userObjects = source.currentObjects
    }
}
