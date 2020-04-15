//
//  WelcomeInteractor.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol WelcomeBusinessLogic {
    func login(request: Welcome.Login.Request)
    func register(request: Welcome.Register.Request)
}


//protocol WelcomeDataStore {
//
//}

class WelcomeInteractor: WelcomeBusinessLogic {
    
    var worker: WelcomeWorker?
    var presenter: WelcomePresenter?
    
    func login(request: Welcome.Login.Request) {
        guard let name = request.name, let password = request.password else {
            let response = Welcome.Login.Response(success: false, message: "Missing fields")
            presenter?.presentLogin(response: response)
            return
        }
        
        guard let response = worker?.authenticateLogin(name: name, password: password) else {
            let response = Welcome.Login.Response(success: false, message: "Internal error")
            presenter?.presentLogin(response: response)
            return
        }
        
        presenter?.presentLogin(response: response)
    }
    
    func register(request: Welcome.Register.Request) {
        
    }
    
}
