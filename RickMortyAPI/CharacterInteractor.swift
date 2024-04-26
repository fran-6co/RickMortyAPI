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
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://rickandmortyapi.com/api/character")!)
        guard let responseHTTP = response as? HTTPURLResponse else { throw NetworkError.nonHTTP }
        if responseHTTP.statusCode == 200 {
            print("Se acaba de hacer una llamada a red")
            return try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
        } else {
            throw NetworkError.badStatusCode(responseHTTP.statusCode)
        }
    }
}

