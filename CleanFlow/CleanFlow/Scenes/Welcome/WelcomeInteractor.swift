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

protocol WelcomeDataStore {
    var name: String? { get set }
    var password: String? { get set }
}

class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore {
    
    var worker: WelcomeWorker?
    var presenter: WelcomePresenterLogic?
    
    var name: String?
    var password: String?
    
    func login(request: Welcome.Login.Request) {
        guard let name = request.name, let password = request.password else {
            let response = Welcome.Login.Response(success: false, message: "Missing fields")
            presenter?.presentLogin(name: "", response: response)
            return
        }
        
        guard let response = worker?.authenticateLogin(name: name, password: password) else {
            let response = Welcome.Login.Response(success: false, message: "Internal error")
            presenter?.presentLogin(name: "", response: response)
            return
        }
        
        self.name = name
        presenter?.presentLogin(name: name, response: response)
    }
    
    func register(request: Welcome.Register.Request) {
        // TO DO
    }
}
