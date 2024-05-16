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
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
//                    .shadow(radius: 8)
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
