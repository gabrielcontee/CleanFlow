//
//  WelcomeModels.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/15/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import Foundation

enum Welcome {
    enum Login {
        
        struct Request {
            var name: String?
            var password: String?
        }
        
        struct Response {
            var success:  Bool
            var message: String?
        }
        
        struct ViewModel {
            var name: String
            var success: Bool
            var message: String?
        }
    }
    
    enum Register {
        
        struct Request {
            var name: String?
            var password: String?
        }
        
        struct Response {
            var success:  Bool
            var message: String?
        }
        
        struct ViewModel {
            var success: Bool
            var message: String?
        }
    }
}
