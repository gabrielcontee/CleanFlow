//
//  WelcomePresenter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol WelcomePresenterLogic: class {
    func presentLogin(name: String, response: Welcome.Login.Response)
    func presentRegister(response: Welcome.Register.Response)
}

class WelcomePresenter: WelcomePresenterLogic {
    
    // weak var because viewController might not be in the screen anymore (router and presenter aren't necessarily synched
    weak var viewController: WelcomeDisplayLogic?
    
    func presentLogin(name: String, response: Welcome.Login.Response) {
        let viewModel = Welcome.Login.ViewModel(name: name, success: response.success, message: response.message)
        viewController?.displayLogin(viewModel: viewModel)
    }
    
    func presentRegister(response: Welcome.Register.Response) {
        
    }
    
}
