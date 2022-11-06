//
//  MainViewController.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var FakeStoreResponse: FakeStoreResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Store"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Something to buy..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchFakeStores()
    }
    
    // MARK: - Methods
    
    
    private func fetchFakeStores(with text: String = "a") {
        networkService.request(FakeStoreRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.FakeStoreResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.fakestore = FakeStoreResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        FakeStoreResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FakeStoreCollectionViewCell
        let FakeStore = FakeStoreResponse?.results?[indexPath.row]
        cell.title = FakeStore?.title
        cell.imageView.downloadImage(from: FakeStore?.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchFakeStores(with: text)
        }
    }
}


