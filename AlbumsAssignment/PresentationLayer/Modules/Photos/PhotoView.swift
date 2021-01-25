//
//  PhotoView.swift
//  AlbumsAssignment
//
//

import UIKit

class PhotoView: UIView {
   // MARK: - Initialization
      override init(frame: CGRect) {
          super.init(frame: frame)
          setupUI()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
   // MARK: - Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
   // MARK: - Actions
      public func reloadView() {
          self.collectionView.reloadData()
      }
}
// MARK: - Extensions
extension PhotoView {
    private func setupUI() {
           if #available(iOS 13.0, *) {
               overrideUserInterfaceStyle = .light
           }
        self.backgroundColor = .white
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        collectionView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
       }
}


