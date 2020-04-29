//
//  DashboardPresenterTests.swift
//  CleanFlowTests
//
//  Created by Gabriel Figueiredo Conde on 4/20/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

@testable import CleanFlow
import XCTest

class DashboardPresenterTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: DashboardPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupDashboardPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupDashboardPresenter() {
        sut = DashboardPresenter()
    }
    
    // MARK: - Test doubles
    
    class DashboardDisplayLogicSpy: DashboardDisplayLogic {
        
        // MARK: Method call expectations
        
        var displayProfileCalled = false
        var displayFreshObjectsCalled = false
        
        // MARK: Argument expectations
        
        var getProfileViewModel: Dashboard.GetProfile.ViewModel!
        var objectsViewModel: Dashboard.GetNewObjects.ViewModel!
        
        // MARK: Spied methods
        
        func displayProfileData(viewModel: Dashboard.GetProfile.ViewModel) {
            displayProfileCalled = true
            self.getProfileViewModel = viewModel
        }
        
        func displayFreshObjects(viewModel: Dashboard.GetNewObjects.ViewModel) {
            displayFreshObjectsCalled = true
            self.objectsViewModel = viewModel
        }
        
    }
    
    // MARK: - Tests
    
    func testPresentedProfileData() {
        // Given
        let profileDataDisplayLogicSpy = DashboardDisplayLogicSpy()
        sut.viewController = profileDataDisplayLogicSpy
        
        // When
        let profile = Profile(name: "Jack Sparrow", image: nil)
        let response = Dashboard.GetProfile.Response(profile: profile, userObjects: ["ship", "sword", "parrot"])
        sut.presentProfile(response: response)
        
        // Then
        let profileViewModel = profileDataDisplayLogicSpy.getProfileViewModel
        let titleDisplayed = profileViewModel!.title
        let nameDisplayed = profileViewModel!.name
        let userObjectsDisplayed = profileViewModel!.userObjects
        
        XCTAssertEqual(userObjectsDisplayed[0], "ship", "Presenting fetched object should properly represent the object from the user")
        XCTAssertEqual(userObjectsDisplayed[1], "sword", "Presenting fetched object should properly represent the object from the user")
        XCTAssertEqual(userObjectsDisplayed[2], "parrot", "Presenting fetched object should properly represent the object from the user")
        
        
        XCTAssertEqual(titleDisplayed, "Bem vindo Jack Sparrow", "Presenting title should represent the formatted title")
        XCTAssertEqual(nameDisplayed, "Jack Sparrow", "Presenting name should represent the user name")
    }
    
    func testPresentFetchedOrdersShouldAskViewControllerToDisplayFetchedOrders()
    {
        // Given
        let dashboardDisplayLogicSpy = DashboardDisplayLogicSpy()
        sut.viewController = dashboardDisplayLogicSpy
        
        // When
        let profile = Profile(name: "Jack Sparrow", image: nil)
        let response = Dashboard.GetProfile.Response(profile: profile, userObjects: ["ship", "sword"])
        sut.presentProfile(response: response)
        
        // Then
        XCTAssert(dashboardDisplayLogicSpy.displayProfileCalled, "Presenting fetched profile data should ask view controller to display them")
    }
}

