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
    var userObjects: [String] { get set }
}

class DashboardInteractor: DashboardDataStore, DashboardBusinessLogic {

    var presenter: DashboardPresentLogic?
    var worker = DashboardWorker(objectsStore: MockDatabase())
    
    var profile: Profile?
    var userObjects: [String] = []
    
    func getProfile(request: Dashboard.GetProfile.Request) {
        // data passed from login
        guard let userProfile = profile else {
            return
        }
        
        let userData = worker.getUserData(name: userProfile.name)
        userObjects = userData.userObjects
        let response = Dashboard.GetProfile.Response(profile: userProfile, userObjects: userObjects)
        presenter?.presentProfile(response: response)
    }

}
