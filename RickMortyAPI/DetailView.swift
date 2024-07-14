//
//  DetailView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 15/5/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm = AvatarViewModel()
    
    let character: RMCharacterDTO
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Group {
                if let image = vm.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    ProgressView()
                        .frame(height: 200)
                }
            }
            .padding(30)
            .shadow(radius: 10, x: 5, y: 5)
            .onAppear {
                vm.getImage(url: character.image)
            }
            
            Text(character.name)
                .bold()
                .font(.title)
            Spacer()
            ShowTrailerButton(showSheet: $showSheet)
                .sensoryFeedback(showSheet ? .selection : .success, trigger: showSheet)
            Text("Open a sheet with the trailer in Youtube.")
                .font(.caption)
                .opacity(0.5)
                .italic()
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
