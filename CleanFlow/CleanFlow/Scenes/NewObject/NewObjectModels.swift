//
//  NewObjectModels.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/24/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

enum NewObject {
    
    enum Add {
        struct Request {
            var objectName: String
        }
        
        struct Response {
            var success: Bool
            var objectsUpdated: [String]
        }
        
        struct ViewModel {
            var success: Bool
            var objectsUpdated: [String]
        }
    }
}
