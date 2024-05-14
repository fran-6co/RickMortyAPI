//
//  AvatarViewModel.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 14/5/24.
//

import SwiftUI

final class AvatarViewModel: ObservableObject {
    @Published var image: UIImage?
    
    func getImage(url: URL) {
        let cacheDirectory = URL.cachesDirectory.appending(component: url.lastPathComponent)
        print(cacheDirectory)
        if FileManager.default.fileExists(atPath: cacheDirectory.path()) {
            if let data = try? Data(contentsOf: cacheDirectory) {
                self.image = UIImage(data: data)
            }
        } else {
            Task {
                await getAsyncImage(url: url)
            }
        }
    }
    
    private func getAsyncImage(url: URL) async {
        do {
            let image = try await ImageDownloader.shared.image(url: url)
            await MainActor.run {
                self.image = image
            }
        } catch {
            print(error)
        }
    }
}
