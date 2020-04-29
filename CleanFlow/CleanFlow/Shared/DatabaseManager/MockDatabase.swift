//
//  MockDatabase.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

typealias Success = Bool

class MockDatabase: NSObject, ObjectsStoreProtocol, UserAccessProtocol {

    let defaults = UserDefaults.standard // symbolic storage
    
    var username: String = ""
    
    static var instance = MockDatabase()
    
    private(set) var users: [String: String] = [
        "gabriel": "12345",
        "paolo": "guerrero",
        "joe": "doe123",
        "test": "test",
        "admin": "admin"
    ]
    
    private var userItens: [String] = [] {
        didSet{
            defaults.set(userItens, forKey: username)
        }
    }
    
    override private init() {
        if let name = defaults.string(forKey: nameDefaultsKey) {
            username = name
        }
        if let usersObjects = defaults.array(forKey: username) as? [String] {
            userItens = usersObjects
        }
    }
    
    func authenticated(username: String, password: String) -> Bool {
        if users[username] == password {
            self.username = username
            return true
        } else {
            return false
        }
    }
    
    func getUsername() -> String {
        return username
    }
    
    func addUserObject(object: String) -> ObjectsList {
        userItens.append(object)
        
        return userItens
    }
    
    func removeUserObject(object: String) -> Success {
        
        userItens = userItens.filter() { $0 == object }
        return true
    }
    
    func fetchUserObjects(username: String) -> [String] {
        return userItens
    }
    
    
}
