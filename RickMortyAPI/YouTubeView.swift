//
//  YouTubeView.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 15/5/24.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/watch?v=WNhH00OIPP0") else { return }
        uiView.load(URLRequest(url: demoURL))
    }
}
