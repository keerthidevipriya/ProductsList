//
//  Album.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 29/07/23.
//

import Foundation

struct Album: Codable {
    var albumId: Int
    var id: Int
    var title: String?
    var updatedTitle: String?
    var url: String?
    var thumbnailUrl: String?
}
