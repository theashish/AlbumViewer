//
//  PhotoViewController.swift
//  AlbumsAssignment
//

import UIKit
protocol PhotoPresenterOutput: class {
    func presenter(didRetrievePhotos items: [Photo])

}
class PhotoViewController: UIViewController {
    var photoView: PhotoView?
    var interactor: PhotoInteractor?
    var router: PhotoRouter?
    var photo=[Photo]()
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let photoServices = PhotoServiceImplementation()
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = photoView
        photoView?.collectionView.delegate = self
        photoView?.collectionView.dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         interactor?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationItem.title = "Photos"
      }
}
// MARK: - PhotoPresenterOutput
extension PhotoViewController: PhotoPresenterOutput {
    func presenter(didRetrievePhotos items: [Photo]) {
        self.photo = items
        self.photoView?.reloadView()
    }
}
// MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath) as! PhotoCollectionViewCell
        let imageUrl=self.photo[indexPath.row].url
        photoServices.getTheAlbumList(imageUrl: imageUrl) { (image) in
            cell.image = image
        }
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: 100.0)
       }
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           insetForSectionAt section: Int) -> UIEdgeInsets {
         return sectionInsets
       }
       
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
       }
}
