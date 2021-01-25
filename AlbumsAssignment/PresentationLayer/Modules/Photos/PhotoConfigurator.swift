//
//  PhotoConfigurator.swift
//  PhotosAssignment
//

import UIKit
class PhotoConfigurator {
    
    static func configureModule(items: [Photo], viewController: PhotoViewController) {
        let view = PhotoView()
        let router = PhotoRouterImplementation()
        let interactor = PhotoInteractorImplementation()
        let presenter = PhotoPresenterImplementation()
        
        viewController.photoView = view
        viewController.router = router
        viewController.interactor = interactor
        interactor.photoList = items
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
