//
//  URL.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 30/4/24.
//

import Foundation

let mainURL = URL(string: "https://rickandmortyapi.com/api")!

extension URL {
    static let characterURL = mainURL.appending(path: "character")
    
    static func characterByIDURL(id: Int) -> URL {
        characterURL.appending(path: String(id))
    }
}
