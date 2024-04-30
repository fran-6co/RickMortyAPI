//
//  ViewModel.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    
    let characterInteractor: CharacterInteractorProtocol
    
    @Published var characters: [RMCharacterDTO] = []
    
    init(characterInteractor: CharacterInteractorProtocol = CharacterInteractor.shared) {
        self.characterInteractor = characterInteractor
        Task { await getCharacters() }
    }
    
    func getCharacters() async {
        do {
            let characterResult = try await characterInteractor.fetchCharacters()
            await MainActor.run {
                self.characters = characterResult.results
            }
        } catch {
            print(error)
        }
    }
}
