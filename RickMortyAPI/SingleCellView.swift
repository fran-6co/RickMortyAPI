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
                .shadow(radius: 3, x: 3, y: 3)
            VStack(alignment: .leading) {
                Text(character.name)
                    .bold()
                Group{
                    Text("Type: \(character.species)")
                    Text("Gender: \(character.gender)")
                    Text("Status: \(character.status)")
                }
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
