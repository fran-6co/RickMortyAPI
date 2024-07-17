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
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: character.created) ?? .now
    }
    let dcf = DateComponentsFormatter()
    
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
            
            GroupBox {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Gender:")
                        Text("Species:")
                        Text("Status:")
                    }
                    .bold()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(character.gender.rawValue)")
                        Text("\(character.species.rawValue)")
                        Text("\(character.status.rawValue)")
                    }
                    .fontWeight(.light)
                }
            }
            .padding(5)
            
            GroupBox {
                Text("First appearence on:")
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date:")
                        Text("Time:")
                    }
                    .bold()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(date.formatted(date: .abbreviated, time: .omitted))")
                        Text("\(date.formatted(date: .omitted, time: .shortened))")
                    }
                }
                .padding(.bottom, 8)
                Text("How much time ago:")
                    .bold()
                Text("\(dcf.string(from: date, to: .now) ?? "")")
            }
            .opacity(0.3)
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
