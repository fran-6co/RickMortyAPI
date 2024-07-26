//
//  PageView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 22/7/24.
//

import SwiftUI

struct Page: View {
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

struct PageView: View {
    let imageNames: [String]
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            Text("Page viewer simple")
            ZStack (alignment: .bottom){
                PageViewUIKitController(pages: imageNames.map { Page(name: $0) }, currentPage: $currentPage)
                PageControl(numberOfPages: imageNames.map{ Page(name: $0) }.count, currentPage: $currentPage)
                    .frame(width: CGFloat(imageNames.map{ Page(name: $0) }.count * 18)) //makes width according to what should measure each dot times how many dots.
            }
            .frame(height: 305)
            Text("Current page: \(currentPage + 1)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{ Color.mint.opacity(0.5) }
        .ignoresSafeArea()
    }
}

#Preview {
    PageView(imageNames: ["topics", "uipagecontrol", "uitextview"])
}
