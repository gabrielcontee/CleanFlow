//
//  DashboardViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardDisplayLogic: class {
    func displayProfile(viewModel: Dashboard.GetProfile.ViewModel)
}

class DashboardViewController: UIViewController, DashboardDisplayLogic  {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var interactor: DashboardBusinessLogic?
    var router: DashboardDataPassing?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = Dashboard.GetProfile.Request()
        interactor?.getProfile(request: request)
    }
    
    private func setup()
    {
      let viewController = self
      let interactor = DashboardInteractor()
      let presenter = DashboardPresenter()
      let router = DashboardRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.dashboardVC = viewController
      router.dataStore = interactor
    }

    func displayProfile(viewModel: Dashboard.GetProfile.ViewModel) {
        usernameLabel.text = viewModel.name
    }

}
