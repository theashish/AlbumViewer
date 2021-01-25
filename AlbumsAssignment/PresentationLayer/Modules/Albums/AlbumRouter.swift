//
//  AlbumRouter.swift
//  AlbumsAssignment
//

import UIKit

protocol AlbumRouter: class {
    var navigationController: UINavigationController? { get }
    func routeToDetail(with items: [Photo])
}

class AlbumRouterImplementation: AlbumRouter {
    func routeToDetail(with items: [Photo]) {
        let viewController = PhotoViewController()
        PhotoConfigurator.configureModule(items: items, viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    weak var navigationController: UINavigationController?
}
