//
//  PhotoInteractor.swift
//  AlbumsAssignment
//

import Foundation
protocol PhotoInteractor: class {
    func viewDidLoad()
}

class PhotoInteractorImplementation: PhotoInteractor {
    var presenter: PhotoPresenter?
    private let albumServices = AlbumServiceImplementation()
    private var albumList: [Album] = []
    var photoList: [Photo]?
    func viewDidLoad() {
        self.presenter?.interactor(didReceivePhotos: photoList ?? [])
    }
}
