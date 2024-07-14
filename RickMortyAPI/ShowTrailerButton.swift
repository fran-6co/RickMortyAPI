//
//  ShowTrailerButton.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 14/7/24.
//

import SwiftUI

struct ShowTrailerButton: View {
    @Binding var showSheet: Bool
    
    var body: some View {
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
}
