//
//  DashboardViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardDisplayLogic: class {
    func displayProfileData(viewModel: Dashboard.GetProfile.ViewModel)
}

class DashboardViewController: UIViewController, DashboardDisplayLogic  {
    
    private let objectCellIdentifier = "objectCellIdentifier"
    
    @IBOutlet weak var objectsTableView: UITableView! {
        didSet {
            objectsTableView.register(UITableViewCell.self, forCellReuseIdentifier: objectCellIdentifier)
        }
    }
    
    var interactor: DashboardBusinessLogic?
    var router: DashboardDataPassing?
    
    var displayedObjects: [String] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.largeTitle(with: .white)
        let request = Dashboard.GetProfile.Request()
        interactor?.getProfile(request: request)
    }
    
    private func setup() {
        let viewController = self
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = DashboardWorker()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dashboardVC = viewController
        router.dataStore = interactor
    }
    
    func displayProfileData(viewModel: Dashboard.GetProfile.ViewModel) {
        self.title = viewModel.name
        displayedObjects = viewModel.userObjects
        
        objectsTableView.reloadData()
    }
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: objectCellIdentifier, for: indexPath) as UITableViewCell
        cell.backgroundColor = .clear
        
        if displayedObjects.count > indexPath.row {
            cell.textLabel?.text = displayedObjects[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
            cell.textLabel?.textColor = .white
        }
        
        return cell
    }
    
}
