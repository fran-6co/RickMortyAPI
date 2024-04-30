//
//  CharacterInteractor.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import Foundation

protocol CharacterInteractorProtocol {
    func fetchCharacters() async throws -> CharacterResponseDTO
}

struct CharacterInteractor: CharacterInteractorProtocol {
    static let shared = CharacterInteractor()
    
    private init() {}
    
    func fetchCharacters() async throws -> CharacterResponseDTO {
        let (data, response) = try await URLSession.shared.getData(url: .characterURL)
        if response.statusCode == 200 {
            print("Se acaba de hacer una llamada a red")
            return try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
        } else {
            throw NetworkError.badStatusCode(response.statusCode)
        }
    }
}

