//
//  NewObjectRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/28/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol NewObjectDataPassing {
    var dataStore: NewObjectDataStore? { get }
}

protocol NewObjectRoutingProtocol {
    func routeToObjectsList()
}

class NewObjectRouter: NewObjectDataPassing, NewObjectRoutingProtocol {
    
    weak var newObjectVC: NewObjectViewController?
    var dataStore: NewObjectDataStore?
    
    func routeToObjectsList() {
        
    }
}


// func routeToListOrders(segue: UIStoryboardSegue?)
// {
//   if let segue = segue {
//     let destinationVC = segue.destination as! ListOrdersViewController
//     var destinationDS = destinationVC.router!.dataStore!
//     passDataToListOrders(source: dataStore!, destination: &destinationDS)
//   } else {
//     let index = viewController!.navigationController!.viewControllers.count - 2
//     let destinationVC = viewController?.navigationController?.viewControllers[index] as! ListOrdersViewController
//     var destinationDS = destinationVC.router!.dataStore!
//     passDataToListOrders(source: dataStore!, destination: &destinationDS)
//     navigateToListOrders(source: viewController!, destination: destinationVC)
//   }
// }
//
//func navigateToListOrders(source: CreateOrderViewController, destination: ListOrdersViewController)
//{
//  source.navigationController?.popViewController(animated: true)
//}
//
//func passDataToListOrders(source: CreateOrderDataStore, destination: inout ListOrdersDataStore)
//{
//}

