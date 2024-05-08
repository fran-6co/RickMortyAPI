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
        VStack(alignment: .leading) {
            Text("\(character.id)")
            Text(character.name)
        }
        
    }
}

#Preview {
    SingleCellView(character: .previewRMCharacter)
}
