//
//  WelcomeViewConfigurator.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

class WelcomeViewConfigurator {

    private let nibName = String(describing: WelcomeViewController.self)

    var viewController: WelcomeViewController

    init(window: UIWindow) {
        viewController = WelcomeViewController(nibName: nibName, bundle: nil)
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter()
        let router = WelcomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = WelcomeWorker()
        presenter.viewController = viewController
        router.welcomeVC = viewController
        router.dataStore = interactor

        let nav = UINavigationController(rootViewController: viewController)
        
        visualSetup()
        
        window.rootViewController = nav
    }
    
    private func visualSetup() {
        viewController.title = "Login"
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        viewController.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        viewController.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}

