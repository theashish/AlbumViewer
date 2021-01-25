//
//  AlbumView.swift
//  AlbumsAssignment
//

import UIKit

class AlbumView: UIView {
   // MARK: - Initialization
      override init(frame: CGRect) {
          super.init(frame: frame)
          setupUI()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
   // MARK: - Properties
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.returnKeyType = .done
        //searchBar.backgroundImage = UIImage()
        //navigationItem.titleView = searchBar
        return searchBar
    }()
   lazy var tableView: UITableView = {
       let tableView = UITableView()
       tableView.rowHeight = 70
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "albumCell")
       tableView.translatesAutoresizingMaskIntoConstraints = false
       return tableView
   }()
   
    
    
   // MARK: - Actions
      public func reloadTableView() {
          self.tableView.reloadData()
      }
}

extension AlbumView {
    private func setupUI() {
           if #available(iOS 13.0, *) {
               overrideUserInterfaceStyle = .light
           }
           self.backgroundColor = .white
           
           self.addSubview(tableView)
           tableView.tableHeaderView = searchBar
           
           NSLayoutConstraint.activate([
               tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
               tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
               tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
               tableView.topAnchor.constraint(equalTo: self.topAnchor),
           ])
       }
}
