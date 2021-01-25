//
//  PhotoCollectionViewCell.swift
//  AlbumsAssignment
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            imageToDisplay.image = image
            
        }
    }
    
    fileprivate let imageToDisplay: UIImageView = {
       let imageToDisplay = UIImageView()
        imageToDisplay.translatesAutoresizingMaskIntoConstraints = false
        imageToDisplay.contentMode = .scaleAspectFill
        imageToDisplay.clipsToBounds = true
        imageToDisplay.layer.cornerRadius = 12
        return imageToDisplay
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(imageToDisplay)
        imageToDisplay.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageToDisplay.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageToDisplay.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageToDisplay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
