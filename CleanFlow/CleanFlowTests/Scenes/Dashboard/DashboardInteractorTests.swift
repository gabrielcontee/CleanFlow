//
//  DashboardInteractorTests.swift
//  CleanFlowTests
//
//  Created by Gabriel Figueiredo Conde on 4/20/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

@testable import CleanFlow
import XCTest

class DashboardInteractorTests: XCTestCase {
  // MARK: - Subject under test
  
  var sut: DashboardInteractor!
  
  // MARK: - Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupDashboardInteractor()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupDashboardInteractor() {
    sut = DashboardInteractor()
  }
  
  // MARK: - Test doubles
  
    class ShowProfilePresentationLogicSpy: DashboardPresentLogic {
        
    // MARK: Method call expectations
    
    var presentProfileCalled = false
    var presentRefreshedObjectsCalled = false
    
    // MARK: Spied methods
    
    func presentProfile(response: Dashboard.GetProfile.Response) {
        
        presentProfileCalled = true
    }
    
    func presentRefreshedObjects(response: Dashboard.GetNewObjects.Response) {
        
        presentRefreshedObjectsCalled = true
    }
    
    
  }
  
  // MARK: - Tests
  
  func testGetProfileShoulCallPresenter() {
    // Given
    let showProfilePresentationLogicSpy = ShowProfilePresentationLogicSpy()
    sut.presenter = showProfilePresentationLogicSpy
    sut.profile = Profile(name: "Dow Jones", image: nil)
    
    // When
    let request = Dashboard.GetProfile.Request()
    sut.getProfile(request: request)
    
    // Then
    XCTAssert(showProfilePresentationLogicSpy.presentProfileCalled, "GetProfile() should call presenter")
  }
}

