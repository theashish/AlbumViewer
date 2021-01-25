//
//  AlbumViewController.swift
//  AlbumsAssignment
//

import UIKit
protocol AlbumPresenterOutput: class {
    func presenter(didRetrieveItems items: [Album])
    func presenter(didObtainPhotoItems items: [Photo])
}

class AlbumViewController: UIViewController {
    // MARK: - Properties
    var albumView: AlbumView?
    var interactor: AlbumInteractor?
    var router: AlbumRouter?
    var albums=[Album]()
    var searchActive : Bool = false
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = albumView
        albumView?.tableView.delegate = self
        albumView?.tableView.dataSource = self
        albumView?.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Albums"
    }
    
}
// MARK: - AlbumPresenterOutput
extension AlbumViewController: AlbumPresenterOutput {
    func presenter(didObtainPhotoItems items: [Photo]) {
        self.router?.routeToDetail(with: items)
    }

    func presenter(didRetrieveItems items: [Album]) {
        self.albums = items
        self.albumView?.reloadTableView()
       
    }
    
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension AlbumViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.albums.count
       }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell")
            cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            cell?.textLabel?.text = self.albums[indexPath.row].title
           return cell!
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectRow(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - UISearchBarDelegate
extension AlbumViewController: UISearchBarDelegate {
          func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.albumView?.searchBar.resignFirstResponder()
          }

          func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
              print("searchText=\(searchText)")
            interactor?.didSearch(searchString: searchText)
          }
   }
