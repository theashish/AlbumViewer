//
//  PhotoPresentor.swift
//  AlbumsAssignment
//

import Foundation
protocol PhotoPresenter: class {
    func interactor(didReceivePhotos photos: [Photo])
}

class PhotoPresenterImplementation: PhotoPresenter {
   weak var viewController: PhotoPresenterOutput?
   func interactor(didReceivePhotos photos: [Photo]) {
        viewController?.presenter(didRetrievePhotos: photos)
    }
     
}
