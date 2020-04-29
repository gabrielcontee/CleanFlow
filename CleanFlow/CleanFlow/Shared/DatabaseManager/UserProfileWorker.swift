//
//  UserProfileWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/29/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

class UserProfileWorker: NSObject {

    var userAccess: UserAccessProtocol

    init(userAccess: UserAccessProtocol) {
        self.userAccess = userAccess
    }
    
    func getUser() -> String {
        return userAccess.getUsername()
    }
}

