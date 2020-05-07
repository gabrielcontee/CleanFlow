//
//  UISearchBar.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 5/6/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    var textColor: UIColor? {
        get {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                return textField.textColor
            } else {
                return nil
            }
        }
        
        set (newValue) {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                textField.textColor = newValue
            }
        }
    }
}

