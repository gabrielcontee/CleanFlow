//
//  UserObjectsWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/27/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

typealias ObjectsList = [String]

protocol ObjectsStoreProtocol {
    func addUserObject(object: String) -> ObjectsList
    func removeUserObject(object: String) -> Success
    func fetchUserObjects(username: String) -> [String]
}

protocol UserAccessProtocol {
    func authenticated(username: String, password: String) -> Bool
    func getUsername() -> String
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
    
    func saveUserObject(object: String) -> ObjectsList {
        return objectsStore.addUserObject(object: object)
    }
}
