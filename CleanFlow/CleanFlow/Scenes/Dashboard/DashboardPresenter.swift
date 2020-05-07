//
//  DashboardPresenter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardPresentLogic: class {
    func presentProfile(response:  Dashboard.GetProfile.Response)
    func presentRefreshedObjects(response: Dashboard.GetNewObjects.Response)
    func presentFilteredObjects(response: Dashboard.FilterObjects.Response)
}

class DashboardPresenter: DashboardPresentLogic {
    
    weak var viewController: DashboardDisplayLogic?
    
    func presentProfile(response: Dashboard.GetProfile.Response) {
        let viewModel = Dashboard.GetProfile.ViewModel(title:  "Bem vindo \(response.profile.name)", name: response.profile.name, userObjects: response.userObjects)
        viewController?.displayProfileData(viewModel: viewModel)
    }
    
    func presentRefreshedObjects(response: Dashboard.GetNewObjects.Response) {
        let viewModel = Dashboard.GetNewObjects.ViewModel(userObjects: response.userObjects)
        viewController?.displayFreshObjects(viewModel: viewModel)
    }
    
    func presentFilteredObjects(response: Dashboard.FilterObjects.Response) {
        let viewModel = Dashboard.FilterObjects.ViewModel(userObjects: response.userObjects)
        viewController?.displayFilteredObjects(viewModel: viewModel)
    }
}
