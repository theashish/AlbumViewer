//
//  AlbumConfigurator.swift
//  AlbumsAssignment
//

import UIKit

class AlbumConfigurator {
    
    static func configureModule(viewController: AlbumViewController) {
        let view = AlbumView()
        let router = AlbumRouterImplementation()
        let interactor = AlbumInteractorImplementation()
        let presenter = AlbumPresenterImplementation()
        
        viewController.albumView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}

