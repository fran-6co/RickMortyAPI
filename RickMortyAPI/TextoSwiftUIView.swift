//
//  SwiftUITextoView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 22/7/24.
//

import SwiftUI

enum FontSize: String, CaseIterable, Identifiable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case xl = "XL"
    
    var id: Self { self }
}

struct SwiftUITextoView: View {
    @State var textoMultiple = "Start writting..."
    @State var tamañoTexto: FontSize = .medium
    
    var body: some View {
        ZStack {
            VStack {
                Text("UIKit view")
                    .font(.largeTitle)
                TextoUIKitView(texto: $textoMultiple, size: tamañoTexto)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .padding(5)
            }
            VStack{
                Text("This is a preview of your text: \(textoMultiple)")
                Spacer()
                Text("Current font size –> \(tamañoTexto.rawValue)")
                
                Menu {
                    ForEach(FontSize.allCases) { size in
                        Button(size.rawValue) {
                            tamañoTexto = size
                        }
                    }
                } label: {
                    Text("Change the text size")
                }
                .buttonStyle(.bordered)

                
                Button("Continue") {
                    textoMultiple = ""
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    SwiftUITextoView()
}
