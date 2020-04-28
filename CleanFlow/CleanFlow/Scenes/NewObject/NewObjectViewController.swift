//
//  NewObjectViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/24/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol NewObjectDisplayLogic: class {
    func displayListWithNewObject(viewModel: NewObject.Add.ViewModel)
}

class NewObjectViewController: UIViewController, NewObjectDisplayLogic {
    
    @IBOutlet weak var newObjectTextField: UITextField!

    var interactor: NewObjectBusinessLogic?
    var router: (NewObjectDataPassing & NewObjectRoutingProtocol)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = NewObjectInteractor()
        let presenter = NewObjectPresenter()
        let router = NewObjectRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.newObjectVC = viewController
        router.dataStore = interactor
    }
    
    @IBAction func saveObjectPressed(_ sender: Any) {
        let request = NewObject.Add.Request(objectName: newObjectTextField.text ?? "")
        interactor?.add(request: request)
    }
    
    func displayListWithNewObject(viewModel: NewObject.Add.ViewModel) {
        if viewModel.objectsUpdated == [] {
            self.showAlert(title: "Failed to add object", message: "Please contact the suport for more information")
        } else {
            router?.routeToObjectsList()
        }
    }
    
}

