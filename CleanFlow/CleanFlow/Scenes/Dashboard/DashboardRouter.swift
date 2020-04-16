//
//  DashboardRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

class DashboardRouter: DashboardDataPassing {
    
    weak var dashboardVC: DashboardViewController?
    
    var dataStore: DashboardDataStore?
}
