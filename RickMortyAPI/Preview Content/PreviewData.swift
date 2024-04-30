//
//  PreviewData.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

extension CharacterListViewModel {
    static let previewVM = CharacterListViewModel(characterInteractor: TestCharacterInteractor())
}

struct TestCharacterInteractor: CharacterInteractorProtocol {
    func fetchCharacters() async throws -> CharacterResponseDTO {
        CharacterResponseDTO(info: Info(count: 69, pages: 420, next: "hola", prev: "hola"), results: getTestJSON())
    }
    
    func getTestJSON() -> [RMCharacterDTO] {
        do {
            return try JSONDecoder().decode(CharacterResponseDTO.self, from: try Data(contentsOf: Bundle.main.url(forResource: "RYM", withExtension: "json")!)).results
        } catch {
            print(error)
            return []
        }
    }
}
