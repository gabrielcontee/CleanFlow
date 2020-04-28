//
//  UserObjectsWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/27/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

protocol ObjectsStoreProtocol {
    func addUserObject(object: String) -> [String]
    func removeUserObject(object: String, from user: String) -> Success
    func fetchUserObjects(username: String) -> [String]
}

protocol UserAccessProtocol {
    func authenticated(username: String, password: String) -> Bool
}

class UserObjectsWorker: NSObject {
    
    var objectsStore: ObjectsStoreProtocol
    
    init(objectsStore: ObjectsStoreProtocol) {
        self.objectsStore = objectsStore
    }
    
    func fetchUserObjects(username: String) -> [String] {
        let objects = objectsStore.fetchUserObjects(username: username)
        return objects
    }
    
    func saveUserObject(object: String) -> [String] {
        return objectsStore.addUserObject(object: object)
    }
}
