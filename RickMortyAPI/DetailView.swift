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
                Text("Show trailer")
            }
        }
        .sheet(isPresented: $showSheet) {
            YouTubeView()
                .presentationDetents([.fraction(0.15), .large])
        }
    }
}

#Preview {
    DetailView(character: .previewRMCharacter)
}
