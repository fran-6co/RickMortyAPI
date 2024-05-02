//
//  ViewModel.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    
    let characterInteractor: CharacterInteractorProtocol
    
    var characterPage = 1
    
    @Published var characters: [RMCharacterDTO] = []
    
    init(characterInteractor: CharacterInteractorProtocol = CharacterInteractor.shared) {
        self.characterInteractor = characterInteractor
        Task { await getCharacters() }
    }
    
    func getCharacters() async {
        do {
            let characterResult = try await characterInteractor.fetchCharacters(page: characterPage)
            await MainActor.run {
                self.characters = characterResult.results
            }
        } catch {
            print(error)
        }
    }
    
    func loadNextCharacterPage(id: Int) {
        if characters.last?.id == id {
            characterPage += 1
            Task {
                await getCharacters()
            }
        }
    }
}
