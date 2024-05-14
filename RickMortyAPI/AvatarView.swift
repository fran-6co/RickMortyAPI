//
//  AvatarView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 14/5/24.
//

import SwiftUI

struct AvatarView: View {
    @ObservedObject var vm = AvatarViewModel()
    let character: RMCharacterDTO

    var body: some View {
        Group {
            if let image = vm.image{
                Image(uiImage: image)
            } else {
                Image(systemName: "popcorn")
            }
        }
        .onAppear {
            vm.getImage(url: character.image)
        }
    }
}

#Preview {
    AvatarView(character: .previewRMCharacter)
}
