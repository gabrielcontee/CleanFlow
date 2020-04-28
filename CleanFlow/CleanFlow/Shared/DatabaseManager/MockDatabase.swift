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
    
    let username = UserDefaults.standard.string(forKey: nameDefaultsKey)
    
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
        return users[username] == password ? true : false
    }
    
    func addUserObject(object: String) -> [String] {
        guard let name = username else {
            return []
        }
        
        if var items = userItens[name] {
            items.append(object)
            userItens[name] = items
            // salvar userItens 
            return items
        } else {
            userItens[name] = [object]
            // salvar userItens
            return [object]
        }
    }
    
    func removeUserObject(object: String, from user: String) -> Success {
        guard let itens = userItens[user] else {
            return false
        }
        userItens[user] = itens.filter() { $0 == object }
        return true
    }
    
    func fetchUserObjects(username: String) -> [String] {
        guard let itens = userItens[username] else {
            return []
        }
        return itens
    }
    
    
}
