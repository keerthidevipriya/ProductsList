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
    
    func getAlbumList() -> [Album] {
        return []
    }
    
    func loadJson(filename fileName: String) -> [Album]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Album].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

class AlbumVC {
    
}
