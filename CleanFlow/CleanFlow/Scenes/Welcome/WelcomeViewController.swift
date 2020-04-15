//
//  WelcomeViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol WelcomeDisplayLogic: class {
    func displayLogin(viewModel: Welcome.Login.ViewModel)
    func displayRegister(viewModel: Welcome.Register.ViewModel)
}

class WelcomeViewController: UIViewController, WelcomeDisplayLogic {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var interactor: WelcomeBusinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup() {
        let welcomeViewController = self
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter()
//        let router = WelcomeRouter()
        welcomeViewController.interactor = interactor
        interactor.presenter = presenter
//        welcomeViewController.router = router
        presenter.viewController = welcomeViewController
//        router.viewController = welcomeViewController
//        router.dataStore = interactor
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let loginRequest = Welcome.Login.Request(name: nameTextField.text, password: passwordTextField.text)
        interactor?.login(request: loginRequest)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
    }
    
    
    func displayLogin(viewModel: Welcome.Login.ViewModel) {
        if viewModel.success {
            // route to login
        } else {
            self.showAlert(title: "Error", message: viewModel.message ?? "")
        }
    }
    
    func displayRegister(viewModel: Welcome.Register.ViewModel) {
        
    }
}
