//
//  DashboardWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/17/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

class DashboardWorker: NSObject {
    
    var userAndobjectsStore: (ObjectsStoreProtocol & UserAccessProtocol)
    
    init(objectsStore: (ObjectsStoreProtocol & UserAccessProtocol)) {
        self.userAndobjectsStore = objectsStore
    }
    
    func getUserData() -> Dashboard.GetProfile.Response {
        
        let username = userAndobjectsStore.getUsername()
        
        let image = UIImage(named: username)
        let profile = Profile(name: username, image: image)
        let itens = userAndobjectsStore.fetchUserObjects(username: username)
        return Dashboard.GetProfile.Response(profile: profile, userObjects: itens)
    }
    
    func getUserObjects() -> [String] {
        
        let username = userAndobjectsStore.getUsername()
        let itens = userAndobjectsStore.fetchUserObjects(username: username)
        return itens
    }
}
