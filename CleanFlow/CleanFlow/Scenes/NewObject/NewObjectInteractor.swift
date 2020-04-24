//
//  NewObjectInteractor.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/24/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

protocol NewObjectBusinessLogic {
    func add(request: NewObject.Add.Request)
}

protocol NewObjectDataStore {
    var username: String? { get set }
    var newObjectName: String? { get set }
}

class NewObjectInteractor: NewObjectBusinessLogic, NewObjectDataStore {
    
    var username: String?
    var newObjectName: String?
    
    func add(request: NewObject.Add.Request) {
        
    }
    
}
