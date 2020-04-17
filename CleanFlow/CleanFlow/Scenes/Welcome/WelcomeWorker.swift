//
//  WelcomeWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

class WelcomeWorker: NSObject {
    
    private let nameDefaultsKey = "name"
    
    func authenticateLogin(name: String, password: String) -> Welcome.Login.Response {
        if MockDatabase.instance.users[name] == password {
            return Welcome.Login.Response(success: true, message: nil)
        } else {
            return Welcome.Login.Response(success: false, message: "Wrong name or password")
        }
    }
    
    // TO DO
//    func registerUser(name: String, password: String) -> Welcome.Register.Response {
//
//    }
    
    func saveUser(_ name: String)
    {
      UserDefaults.standard.set(name, forKey: nameDefaultsKey)
    }
    
    func getName() -> String?
    {
      return UserDefaults.standard.string(forKey: nameDefaultsKey)
    }
}
