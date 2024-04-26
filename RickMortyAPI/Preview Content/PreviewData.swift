//
//  PreviewData.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

struct TestCharacterInteractor: CharacterInteractorProtocol {
    func fetchCharacters() async throws -> CharacterResponseDTO {
        CharacterResponseDTO(info: Info(count: 69, pages: 420, next: "hola", prev: "hola"), results: [])
    }
}
