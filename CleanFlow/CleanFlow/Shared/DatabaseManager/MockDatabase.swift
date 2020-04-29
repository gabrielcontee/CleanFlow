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
    
    override private init() {
        if let name = defaults.string(forKey: nameDefaultsKey) {
            username = name
        }
    }
    
    private(set) var users: [String: String] = [
        "gabriel": "12345",
        "paolo": "guerrero",
        "joe": "doe123",
        "test": "test",
        "admin": "admin"
    ]
    
    private var userItens: [String: [String]] = [:]
//        "gabriel": [
//            "Car",
//            "Notebook",
//            "PS4",
//            "Bike"
//        ],
//        "paolo": [
//            "Ball",
//            "Hat",
//            "Knife"
//        ],
//        "joe": []
//    ]
    
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
        
        if var items = userItens[username] {
            items.append(object)
            userItens[username] = items
            // salvar userItens
            
            
            return items
        } else {
            userItens[username] = [object]
            // salvar userItens
            return [object]
        }
    }
    
    func removeUserObject(object: String) -> Success {
        
        guard let itens = userItens[username] else {
            return false
        }
        userItens[username] = itens.filter() { $0 == object }
        return true
    }
    
    func fetchUserObjects(username: String) -> [String] {
        guard let itens = userItens[username] else {
            return []
        }
        return itens
    }
    
    
}
