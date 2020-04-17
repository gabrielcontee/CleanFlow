//
//  DashboardWorker.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/17/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

class DashboardWorker: NSObject {
    
    func getUserData(name: String) -> Dashboard.GetProfile.Response {
        let image = UIImage(named: name)
        let profile = Profile(name: name, image: image)
        let itens = MockDatabase.instance.usersItens[name]
        return Dashboard.GetProfile.Response(profile: profile, userObjects: itens ?? [])
    }
    
}
