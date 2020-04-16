//
//  DashboardInteractor.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardBusinessLogic {
    func getProfile(request: Dashboard.GetProfile.Request)
}
protocol DashboardDataStore: class {
    var profile: Profile? { get set }
}

class DashboardInteractor: DashboardDataStore, DashboardBusinessLogic {
    
    var presenter: DashboardPresentLogic?
    
    var profile: Profile?
    
    func getProfile(request: Dashboard.GetProfile.Request) {
        // data passed from login
        guard let userProfile = profile else {
            return
        }
        let response = Dashboard.GetProfile.Response(profile: userProfile)
        presenter?.presentProfile(response: response)
    }

}
