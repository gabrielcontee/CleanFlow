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
    var newObjectName: String? { get set }
    var currentObjects: [String] { get set }
}

class NewObjectInteractor: NewObjectBusinessLogic, NewObjectDataStore {
    
    var newObjectName: String?
    var currentObjects: [String] = []
    
    var presenter: NewObjectPresentLogic?
    var userObjectsWorker = UserObjectsWorker(objectsStore: MockDatabase.instance)
    
    func add(request: NewObject.Add.Request) {
        
        let objectsReturned = userObjectsWorker.saveUserObject(object: request.objectName)
        print(objectsReturned)
        let response = NewObject.Add.Response(success: true, objectsUpdated: objectsReturned)
        presenter?.presentNewObject(response: response)
    }
    
}
