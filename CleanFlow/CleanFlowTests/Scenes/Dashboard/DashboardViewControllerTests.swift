//
//  MockDatabase.swift
//  CleanFlowTests
//
//  Created by Gabriel Figueiredo Conde on 4/20/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

@testable import CleanFlow
import XCTest

class DashboardViewControllerTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: DashboardViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupDashboardViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupDashboardViewController() {
        let nibName = String(describing: DashboardViewController.self)
        sut = DashboardViewController(nibName: nibName, bundle: nil)
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class DashboardBusinessLogicSpy: DashboardBusinessLogic {

        // MARK: Method call expectations
        
        var getProfileCalled = false
        var refreshObjectsCalled = false
        
        // MARK: Spied methods
        
        func getProfile(request: Dashboard.GetProfile.Request) {
            getProfileCalled = true
        }
        
        func refreshObjects(request: Dashboard.GetNewObjects.Request) {
            refreshObjectsCalled = true
        }
        
    }
    
    class TableViewSpy: UITableView {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFetchOrdersWhenViewDidAppear() {
        // Given
        let dashboardBusinessLogicSpy = DashboardBusinessLogicSpy()
        sut.interactor = dashboardBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssertTrue(dashboardBusinessLogicSpy.getProfileCalled, "Should get profile right after the view appears")
    }
    
    func testShouldDisplayFetchedOrders() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.objectsTableView = tableViewSpy
        
        // When
        let viewModel = Dashboard.GetProfile.ViewModel(title: "Welcome my dear", name: "Dow Jones", userObjects: ["PETR4", "GOOGL3", "ELET3"])
        sut.displayProfileData(viewModel: viewModel) // Should call reloadData in tableView
        
        // Then
        XCTAssertTrue(tableViewSpy.reloadDataCalled, "Displaying fetched objects that should appear table view reloads")
    }
    
    func testNumberOfRowsInObjectsTableView() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.objectsTableView = tableViewSpy
        let ordersTableView = sut.objectsTableView
        
        let testDisplayedObjects = Dashboard.GetProfile.ViewModel(title: "Welcome my dear", name: "Dow Jones", userObjects: ["PETR4", "GOOGL3", "ELET3"]).userObjects
        sut.displayedObjects = testDisplayedObjects
        
        // When
        let numberOfRows = sut.tableView(ordersTableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayedObjects.count, "The number of table view rows should equal the number of objects to display")
    }
    
    func testConfiguredObjectsCellInTableView() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.objectsTableView = tableViewSpy
        let objectsTableView = sut.objectsTableView
        
        let testDisplayedObjects = Dashboard.GetProfile.ViewModel(title: "Welcome my dear", name: "Dow Jones", userObjects: ["PETR4", "GOOGL3", "ELET3"]).userObjects
        sut.displayedObjects = testDisplayedObjects
        
        // When
        let firstCell = sut.tableView(objectsTableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        let secondCell = sut.tableView(objectsTableView!, cellForRowAt: IndexPath(row: 1, section: 0))
        let thirdCell = sut.tableView(objectsTableView!, cellForRowAt: IndexPath(row: 2, section: 0))
        let fourthCell = sut.tableView(objectsTableView!, cellForRowAt: IndexPath(row: 3, section: 0))
        
        // Then
        XCTAssertEqual(firstCell.textLabel?.text, "PETR4")
        XCTAssertEqual(secondCell.textLabel?.text, "GOOGL3")
        XCTAssertEqual(thirdCell.textLabel?.text, "ELET3")
        XCTAssertNil(fourthCell.textLabel?.text)
    }
}


