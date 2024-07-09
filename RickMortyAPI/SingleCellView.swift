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
                .shadow(radius: 4, x: 3, y: 3)
            VStack(alignment: .leading) {
                Text(character.name)
                    .bold()
                Group{
                    Text("Type: \(character.species.rawValue.capitalized)")
                    Text("Gender: \(character.gender.rawValue.capitalized)")
                    Text("Status: \(character.status.rawValue.capitalized)")
                }
                    .font(.caption)
                    .italic()
                    .padding(.horizontal)
            }
            .padding(7)
        }
        
    }
}

#Preview {
    List {
        SingleCellView(character: .previewRMCharacter)
    }
}
