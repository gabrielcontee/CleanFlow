//
//  MockDatabase.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

final class MockDatabase: NSObject {
    
    private override init() {}
    
    static var instance = MockDatabase()
    
    let users: [String: String] = [
        "gabriel": "12345",
        "paolo": "guerrero",
        "joe": "doe123"
    ]
    
    let usersItens: [String: [String]] = [
        "gabriel": [
            "Car",
            "Notebook",
            "PS4",
            "Bike"
        ],
        "paolo": [
            "Ball",
            "Hat",
            "Knife"
        ],
        "joe": []
    ]
}
