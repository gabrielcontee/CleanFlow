//
//  NavigationController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/29/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
    
    func getVCinStack(ofClass: AnyClass) -> UIViewController? {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            return vc
        } else {
            return nil
        }
    }
}
