//
//  NewObjectPresenter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/24/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol NewObjectPresentLogic: class {
    func presentNewObject(response:  NewObject.Add.Response)
}

class NewObjectPresenter: NewObjectPresentLogic {
    
    weak var viewController: NewObjectDisplayLogic?
    
    func presentNewObject(response:  NewObject.Add.Response) {
        let viewModel = NewObject.Add.ViewModel(success: response.success, objectsUpdated: response.objectsUpdated)
        viewController?.displayListWithNewObject(viewModel: viewModel)
    }
}


