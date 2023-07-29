//
//  Api.swift
//  ProductstList
//
//  Created by Keerthi Devipriya(kdp) on 29/07/23.
//

import Foundation


class ApiIntegration {
    enum UrlConstants {
        static let url = "https://jsonplaceholder.typicode.com/photos"
    }
    
    func loadJson() -> [Album] {
        if let url = Bundle.main.url(forResource: "mockalbums", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Album].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

class AlbumsViewModel {
    var model = ApiIntegration().loadJson()
    func getAlbumGroup() -> [Int: [Album]] {
        let albumgroup = model.group(by: {$0.albumId})
        return albumgroup
    }
}

class Box<A> {
    var value: A
    init(_ val: A) {
        self.value = val
    }
}

public extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var categories: [U: Box<[Iterator.Element]>] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.value.append(element) {
                categories[key] = Box([element])
            }
        }
        var result: [U: [Iterator.Element]] = Dictionary(minimumCapacity: categories.count)
        for (key, val) in categories {
            result[key] = val.value
        }
        return result
    }
}
