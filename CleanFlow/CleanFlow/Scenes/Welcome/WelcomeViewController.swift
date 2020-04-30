//
//  WelcomeViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit
import Registration

protocol WelcomeDisplayLogic: class {
    func displayLogin(viewModel: Welcome.Login.ViewModel)
    func displayRegister(viewModel: Welcome.Register.ViewModel)
}

class WelcomeViewController: UIViewController, WelcomeDisplayLogic {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var interactor: WelcomeBusinessLogic?
    var router: (WelcomeRoutingLogic & WelcomeDataPassing)?
    
    @IBAction func loginPressed(_ sender: Any) {
        let loginRequest = Welcome.Login.Request(name: nameTextField.text, password: passwordTextField.text)
        interactor?.login(request: loginRequest)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let mock = RegisterWorker()
        let mockMsg = mock.register(username: "", password: "")
        self.showAlert(title: mockMsg, message: mockMsg)
    }
    
    func displayLogin(viewModel: Welcome.Login.ViewModel) {
        if viewModel.success {
            router?.routeToDashboard(viewModel: viewModel)
        } else {
            self.showAlert(title: "Error", message: viewModel.message ?? "")
        }
    }
    
    func displayRegister(viewModel: Welcome.Register.ViewModel) {
        // TO DO
    }
}
