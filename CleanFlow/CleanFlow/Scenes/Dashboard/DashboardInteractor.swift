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
    func refreshObjects(request: Dashboard.GetNewObjects.Request)
    func filterObjects(request: Dashboard.FilterObjects.Request)
}

protocol DashboardDataStore: class {
    var profile: Profile? { get set }
    var userObjects: [String] { get set }
}

class DashboardInteractor: DashboardDataStore, DashboardBusinessLogic {

    var presenter: DashboardPresentLogic?
    var worker = DashboardWorker(objectsStore: MockDatabase.instance)
    
    var profile: Profile?
    var userObjects: [String] = []

    func getProfile(request: Dashboard.GetProfile.Request) {
        
        let userData = worker.getUserData()
        let response = Dashboard.GetProfile.Response(profile: userData.profile, userObjects: userData.userObjects)
        presenter?.presentProfile(response: response)
    }
    
    func refreshObjects(request: Dashboard.GetNewObjects.Request) {
        
        let objects = worker.getUserObjects()
        let response = Dashboard.GetNewObjects.Response(userObjects: objects)
        presenter?.presentRefreshedObjects(response: response)
    }
    
    func filterObjects(request: Dashboard.FilterObjects.Request) {
        
        let text = request.text
        let currentObjects = request.currentObjects
        
        guard text != "" else {
            let response = Dashboard.FilterObjects.Response(userObjects: currentObjects)
            presenter?.presentFilteredObjects(response: response)
            return
        }
        
        let filteredObjs = currentObjects.filter({
            $0.range(of: text, options: .caseInsensitive) != nil
        })
    
        let response = Dashboard.FilterObjects.Response(userObjects: filteredObjs)
        presenter?.presentFilteredObjects(response: response)
    }
}
