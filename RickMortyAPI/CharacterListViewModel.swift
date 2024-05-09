//
//  ViewModel.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

enum CharacterListViewStatus {
    case loading, loaded, error
}

final class CharacterListViewModel: ObservableObject {
    
    let characterInteractor: CharacterInteractorProtocol
    
    @Published var characters: [RMCharacterDTO] = []
    @Published var viewStatus: CharacterListViewStatus = .loading
    @Published var genderFilter: Gender = .all {
        didSet {
            characters.removeAll()
            characterPage = 1
            Task { await getCharacters() }
        }
    }
    @Published var searchText = "" {
        didSet {
            characterPage = 1
        }
    }
    
    var isLastPage = false
    var characterPage = 1
    
    init(characterInteractor: CharacterInteractorProtocol = CharacterInteractor.shared) {
        self.characterInteractor = characterInteractor
        Task { await getCharacters() }
    }
    
//    func getCharacters() async {
//        viewStatus = .loading
//        if characterPage == 1 {
//            characters.removeAll()
//        }
//        do {
//            let characterResult = try await characterInteractor.fetchCharacters(page: characterPage, name: searchText, gender: genderFilter == .all ? "" : genderFilter.rawValue)
//            self.characters += characterResult.results
//            isLastPage = characterResult.info.next == nil
//            viewStatus = .loaded
//        } catch {
//            print(error)
//                viewStatus = .loaded
//        }
//    }
    
    func getCharacters() async {
        await MainActor.run {
            viewStatus = .loading
            if characterPage == 1 {
                characters.removeAll()
            }
        }
        do {
            let characterResult = try await characterInteractor.fetchCharacters(page: characterPage, name: searchText, gender: genderFilter == .all ? "" : genderFilter.rawValue)
            await MainActor.run {
                self.characters += characterResult.results
                isLastPage = characterResult.info.next == nil
                viewStatus = .loaded
            }
        } catch {
            print(error)
            await MainActor.run {
                viewStatus = .loaded
            }
        }
    }
    
    func loadNextCharacterPage(id: Int) async {
        if characters.last?.id == id && !isLastPage {
            characterPage += 1
            Task {
                await getCharacters()
            }
        }
    }
    
    func filteredCharacters() {
        
    }
}
