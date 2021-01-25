//
//  AlbumServices.swift
//  AlbumsAssignment
//

import Foundation
import Alamofire
protocol AlbumService: class {
    func getTheAlbumList(completion:@escaping([Album]?) -> Void)
    func getThePhotosList(completion: @escaping([Photo]?) -> Void)
}

class AlbumServiceImplementation: AlbumService {
   func getTheAlbumList(completion:@escaping([Album]?) -> Void){
             let api = "\(BaseUrls.BASE_URL)\(BaseUrls.ALBUMS)"
          print("api=\(api)")
       var albumList=[Album]()
        AF.request(api, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in

         print("responseData=\(String(describing: responseData.data))")
            guard let data = responseData.data else {
              print(responseData.error?.localizedDescription ?? "Something went wrong")
              completion(nil)
              return

            }
            do{
                print("data=\(data)")
               albumList = try JSONDecoder().decode([Album].self, from: responseData.data!)
               print("albumList=\(albumList)")
               completion(albumList)
           
            }
            catch let error{
              print(error.localizedDescription)
               completion(nil)
               return
            }
        }
    
       
      }
    func getThePhotosList(completion: @escaping([Photo]?) -> Void) {
          let api = "\(BaseUrls.BASE_URL)\(BaseUrls.PHOTOS)"
                   print("api=\(api)")
         var photoList=[Photo]()
         AF.request(api, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
                print("responseData=\(String(describing: responseData.data))")
                guard let data = responseData.data else {
                      print(responseData.error?.localizedDescription ?? "Something went wrong")
                      completion(nil)
                      return
                }
                do{
                    print("data=\(data)")
                    photoList = try JSONDecoder().decode([Photo].self, from: data)
                    completion(photoList)
                }
                catch let error{
                    print(error.localizedDescription)
                    completion(nil)
                    return
                }
            }
       }
}



