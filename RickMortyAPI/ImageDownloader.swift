//
//  ImageDownloader.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 10/5/24.
//

import Foundation
import SwiftUI

actor ImageDownloader {
    static let shared = ImageDownloader()
    
    private enum ImageStatus {
        case downloading(task: Task<UIImage, Error>)
        case downloaded(image: UIImage)
    }
    
    private var imageCache: [URL: ImageStatus] = [:]
    
    func getImage(url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let image = UIImage(data: data){
            return image
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func image(url: URL) async throws -> UIImage {
        if let imageStatus = imageCache[url] {
            switch imageStatus {
                case .downloading(let task):
                    return try await task.value
                case .downloaded(let image):
                    return image
            }
        }
        let task = Task {
            try await getImage(url: url)
        }
        
        imageCache[url] = .downloading(task: task)
        
        do {
            let image = try await task.value
            imageCache[url] = .downloaded(image: image)
            try await saveImage(url: url)
            return image
        } catch {
            imageCache.removeValue(forKey: url)
            throw error
        }
    }
    
    private func saveImage(url: URL) async throws {
        guard let imageStatus = imageCache[url] else { return }
        let path = url.lastPathComponent
        let cacheDirectory = URL.cachesDirectory.appending(path: path)
        print("Se ha creado una url para cache: \(cacheDirectory)")
        
        if case .downloaded(let image) = imageStatus {
            let data = image.heicData()
            try data?.write(to: cacheDirectory, options: .atomic)
            imageCache.removeValue(forKey: url)
        }

    }
}
