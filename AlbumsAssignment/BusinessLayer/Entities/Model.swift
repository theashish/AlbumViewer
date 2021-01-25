//
//  Model.swift
//  AlbumsAssignment
//

import Foundation

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}
struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

