//
//  ViewController.swift
//  Registration
//
//  Created by gabrielcontee on 04/30/2020.
//  Copyright (c) 2020 gabrielcontee. All rights reserved.
//

import Registration
import UIKit

class ViewController: UIViewController {
    
    let a = RegisterWorker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let message = a.register(username: "", password: "")
        let alertController = UIAlertController(title: message, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {
            action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

