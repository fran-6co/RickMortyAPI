//
//  SingleCellView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 3/5/24.
//

import SwiftUI

struct SingleCellView: View {
    let character: RMCharacterDTO
    
    var body: some View {
        HStack {
            AvatarView(character: character)
            VStack(alignment: .leading) {
                Text(character.name)
                    .bold()
                Text("id: \(character.id)")
                    .font(.caption)
                    .italic()
                    .padding(.horizontal)
            }
            .padding()
        }
        
    }
}

#Preview {
    List {
        SingleCellView(character: .previewRMCharacter)
    }
}
