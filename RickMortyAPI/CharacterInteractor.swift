//
//  CharacterInteractor.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import Foundation

protocol CharacterInteractorProtocol {
    func fetchCharacters(page: Int) async throws -> CharacterResponseDTO
}

struct CharacterInteractor: CharacterInteractorProtocol, NetworkInteractor {
    
    var session: URLSession
    
    static let shared = CharacterInteractor()
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchCharacters(page: Int) async throws -> CharacterResponseDTO {
        try await getJSONfromData(request: .get(url: .characterURL, page: page), type: CharacterResponseDTO.self)
//        try await getJSONfromData(url: .characterURL, type: CharacterResponseDTO.self)
    }
}

