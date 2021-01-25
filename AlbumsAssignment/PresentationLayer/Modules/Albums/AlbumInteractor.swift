//
//  AlbumInteractor.swift
//  AlbumsAssignment
//

import Foundation
protocol AlbumInteractor: class {
    func viewDidLoad()
    func didSelectRow(at index: Int)
    func didSearch(searchString: String)
}

class AlbumInteractorImplementation: AlbumInteractor {
    var presenter: AlbumPresenter?
    private let albumServices = AlbumServiceImplementation()
    private var albumList: [Album] = []
    private var photoList: [Photo] = []
    func viewDidLoad() {
        albumServices.getTheAlbumList(completion: {(album) in
            self.albumList = album ?? []
            self.albumServices.getThePhotosList { (photo) in
                self.photoList = photo ?? []
                self.presenter?.interactor(didReceiveAlbums: self.albumList)
            }
        })
    }
    func didSelectRow(at index: Int) {
        print("index=\(index)")
         let nextScreenDataArray = self.photoList.filter{ $0.albumId == self.albumList[index].id}
        self.presenter?.interactor(didRowTapped: nextScreenDataArray)
    }
    func didSearch(searchString: String) {
        let filteredArray = self.albumList.filter{$0.title.contains(searchString)}
        if filteredArray.count == 0 {
            self.presenter?.interactor(didReceiveAlbums: self.albumList)
        }else {
            self.presenter?.interactor(didReceiveAlbums: filteredArray)
        }
        
    }
}
