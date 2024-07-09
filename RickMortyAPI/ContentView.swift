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
        NavigationStack {
            Group {
                switch vm.viewStatus {
                    case .loading:
                        ProgressView {
                            Text("Connecting to multiple characters from many galaxies to your phone. Please wait.")
                                .padding(25)
                        }
                        .controlSize(.extraLarge)
                    case .loaded:
                        List {
                            if vm.characters.isEmpty {
                                ContentUnavailableView("There are no matches in any galaxy for your search.", systemImage: "eye", description: Text("We are trying to find it in other galaxies but this might take a few thousand years. You may want to search for other characters meanwhile."))
                            }
                            ForEach(vm.characters) { character in
                                NavigationLink(value: character) {
                                    SingleCellView(character: character)
                                        .onAppear {
                                            Task {
                                                await vm.loadNextCharacterPage(id: character.id)
                                            }
                                        }
                                }
                            }
                        }
                    case .error:
                        CustomAlertView(alertDescription: "No tienes cobertura, prueba luego", alertTitle: "Esto no funciona", alertButtonTitle: "boton") {
                            vm.viewStatus = .loaded
                        }
                }
            }
            .navigationDestination(for: RMCharacterDTO.self) { character in
                DetailView(character: character)
            }
            .navigationTitle("Rick & Morty 🥒🥒")
            .searchable(text: $vm.searchText, prompt: "Search your character")
            .onChange(of: vm.searchText) { oldValue, newValue in
                Task {
                    try await Task.sleep(for: .seconds(0.5))
                    if newValue == vm.searchText {
                        await vm.getCharacters()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("GenrePicker", selection: $vm.genderFilter) {
                        ForEach(Gender.allCases) { filter in
                            Text(filter.rawValue.capitalized)
                        }
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
