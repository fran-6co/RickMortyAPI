//
//  DetailView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 15/5/24.
//

import SwiftUI

struct DetailView: View {
    //    @Environment(\.dismiss) private var dismiss
    let character: RMCharacterDTO
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Text(character.name)
            Button {
                showSheet.toggle()
            } label: {
                Group {
                    Text("Show TRAILER")
                    Image(systemName: "popcorn")
                        .font(.title2)
                }
                .bold()
            }
            .controlSize(.large)
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
        }
        .sheet(isPresented: $showSheet) {
            YouTubeView()
                .presentationDetents([.fraction(0.25), .large])
        }
    }
}

#Preview {
    DetailView(character: .previewRMCharacter)
}
