//
//  AlbumPresentor.swift
//  AlbumsAssignment
//

import Foundation
protocol AlbumPresenter: class {
    func interactor(didReceiveAlbums albums: [Album])
    func interactor(didRowTapped photos: [Photo])
    
}

class AlbumPresenterImplementation: AlbumPresenter {
   weak var viewController: AlbumPresenterOutput?
      
      func interactor(didReceiveAlbums albums: [Album]) {
          viewController?.presenter(didRetrieveItems: albums)
      }
    
    func interactor(didRowTapped photos: [Photo]) {
        viewController?.presenter(didObtainPhotoItems: photos)
    }
}
