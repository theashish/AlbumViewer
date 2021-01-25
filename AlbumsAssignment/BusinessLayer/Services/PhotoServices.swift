//
//  PhotoServices.swift
//  AlbumsAssignment
//

import Foundation
import Alamofire
import AlamofireImage
protocol PhotoService: class {
    func getTheAlbumList(imageUrl: String, completion:@escaping(UIImage?) -> Void)
}

class PhotoServiceImplementation: PhotoService {
   func getTheAlbumList(imageUrl: String, completion:@escaping(UIImage?) -> Void){
    
    AF.request(imageUrl).responseImage { response in
        if case .success(let image) = response.result {
            completion(image)
        }
        else {
            completion(nil)
        }
     }
    }
}
