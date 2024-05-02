//
//  ContentView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = CharacterListViewModel()
    
    var body: some View {
        List {
            ForEach(vm.characters) { character in
                VStack(alignment: .leading) {
                    Text("\(character.id)")
                    Text(character.name)
                }
                .onAppear {
                    Task{
                        vm.loadNextCharacterPage(id: character.id)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
//    ContentView(vm: .previewVM)
}
