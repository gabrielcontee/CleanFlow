//
//  DashboardModels.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

enum Dashboard {
    
    enum GetProfile {
        
        struct Request {}
        
        struct Response {
            var profile: Profile
            var userObjects: [String]
        }
        
        struct ViewModel {
            var title: String
            var name: String
            var userObjects: [String]
        }
    }
    
}
