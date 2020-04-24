//
//  NewObjectRouter.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/24/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol NewObjectDataPassing {
    var dataStore: NewObjectDataStore? { get }
}

class NewObjectRouter: NewObjectDataPassing {
    
    weak var NewObjectVC: NewObjectViewController?
    
    var dataStore: NewObjectDataStore?
}



