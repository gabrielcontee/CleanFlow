//
//  WelcomeViewControllerTests.swift
//  CleanFlowTests
//
//  Created by Gabriel Figueiredo Conde on 4/20/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

@testable import CleanFlow
import XCTest

class WelcomeViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: WelcomeViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupDashboardViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupDashboardViewController() {
        
        window = UIWindow()
        
        let welcomeViewConfigurator = WelcomeViewConfigurator(window: window)
    
        sut = welcomeViewConfigurator.viewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Tests
    
    
}
