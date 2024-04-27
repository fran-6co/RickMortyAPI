//
//  ContentView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = CharacterListViewModel(characterInteractor: CharacterInteractor.shared)
    
    var body: some View {
        List {
            ForEach(vm.characters) { character in
                Text(character.name)
            }
        }
    }
}

#Preview {
//    ContentView()
    ContentView(vm: CharacterListViewModel(characterInteractor: TestCharacterInteractor()))
}
