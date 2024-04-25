//
//  CharacterInteractor.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case nonHTTP, badStatusCode(Int)
    var errorDescription: String {
        switch self {
            case .nonHTTP:
                "No es una conexión HTTP."
            case .badStatusCode(let statusCode):
                "Error de status \(statusCode)"
        }
    }
}

struct CharacterInteractor {
    static let shared = CharacterInteractor()
    
    func getCharacters() async throws -> CharacterResponseDTO {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://rickandmortyapi.com/api/character")!)
        guard let responseHTTP = response as? HTTPURLResponse else { throw NetworkError.nonHTTP }
        if responseHTTP.statusCode == 200 {
            return try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
        } else {
            throw NetworkError.badStatusCode(responseHTTP.statusCode)
        }
    }
}
