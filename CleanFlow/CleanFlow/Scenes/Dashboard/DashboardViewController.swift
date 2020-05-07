//
//  DashboardViewController.swift
//  CleanFlow
//
//  Created by Gabriel Figueiredo Conde on 4/16/20.
//  Copyright © 2020 Gabriel Figueiredo Conde. All rights reserved.
//

import UIKit

protocol DashboardDisplayLogic: class {
    func displayProfileData(viewModel: Dashboard.GetProfile.ViewModel)
    func displayFreshObjects(viewModel: Dashboard.GetNewObjects.ViewModel)
    func displayFilteredObjects(viewModel: Dashboard.FilterObjects.ViewModel)
}

class DashboardViewController: UIViewController, DashboardDisplayLogic  {
    
    private let objectCellIdentifier = "objectCellIdentifier"
    
    enum Section: CaseIterable {
        case main
    }
    
    typealias DataSource = UITableViewDiffableDataSource<Section, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, String>
    
    @IBOutlet weak var objectsTableView: UITableView! {
        didSet {
            objectsTableView.register(UITableViewCell.self, forCellReuseIdentifier: objectCellIdentifier)
        }
    }
    
    @IBOutlet weak var objectsSearchBar: UISearchBar! {
        didSet {
            objectsSearchBar.delegate = self
            objectsSearchBar.textColor = .white
        }
    }
    
    var interactor: DashboardBusinessLogic?
    var router: (DashboardDataPassing & DashboardRoutingLogic)?
    
    var displayedObjects: [String] = []
    var objectFilter: String?
    var dataSource: DataSource!
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.largeNavBar()
        setupObjectsTableViewDS()
        let request = Dashboard.GetProfile.Request()
        interactor?.getProfile(request: request)
    }
    
    private func setup() {
        let viewController = self
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dashboardVC = viewController
        router.dashboardDataStore = interactor
    }
    
    private func setupObjectsTableViewDS(){
        dataSource = UITableViewDiffableDataSource<Section, String>(tableView: objectsTableView) { (objectsTableView: UITableView, indexPath: IndexPath, object: String) -> UITableViewCell? in
            
            let cell = objectsTableView.dequeueReusableCell(withIdentifier: self.objectCellIdentifier, for: indexPath) as UITableViewCell
            cell.backgroundColor = .clear
            
            if self.displayedObjects.count > indexPath.row {
                cell.textLabel?.text = self.displayedObjects[indexPath.row]
                cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
                cell.textLabel?.textColor = .white
            }
            
            return cell
        }
    }
    
    private func setupUI(userImage: UIImage) {
        
        let imageView = UIImageView(image: userImage)
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    @IBAction func addNewObjectPressed(_ sender: Any) {
        router?.routeToNewObject(userObjects: displayedObjects)
    }
    
    // MARK: - Display Methods
    
    func displayProfileData(viewModel: Dashboard.GetProfile.ViewModel) {
        self.title = viewModel.title
        displayedObjects = viewModel.userObjects
        
        if let userImage = UIImage(named: viewModel.name) {
            setupUI(userImage: userImage)
        }
        
        updateTableData(objects: displayedObjects)
    }
    
    func requestObjectsRefresh(){
        interactor?.refreshObjects(request: Dashboard.GetNewObjects.Request())
    }
    
    func displayFreshObjects(viewModel: Dashboard.GetNewObjects.ViewModel) {
        
        displayedObjects = viewModel.userObjects
        self.objectsTableView.reloadData()
    }
    
    func displayFilteredObjects(viewModel: Dashboard.FilterObjects.ViewModel){
        let filteredObjects = viewModel.userObjects
        updateTableData(objects: filteredObjects)
    }
    
    private func updateTableData(objects: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(objects)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let request = Dashboard.FilterObjects.Request(text: searchText, currentObjects: displayedObjects)
        interactor?.filterObjects(request: request)
    }
}

private struct Const {
    static let ImageSizeForLargeState: CGFloat = 40
    static let ImageRightMargin: CGFloat = 16
    static let ImageBottomMarginForLargeState: CGFloat = 12
    static let ImageBottomMarginForSmallState: CGFloat = 6
    static let ImageSizeForSmallState: CGFloat = 32
    static let NavBarHeightSmallState: CGFloat = 44
    static let NavBarHeightLargeState: CGFloat = 96.5
}
