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
        case downloadPending(task: Task<UIImage, Error>)
        case downloaded(image: UIImage)
    }
    
    private var imageCache: [URL: ImageStatus] = [:]
    
    private func getImage(url: URL) async throws -> UIImage {
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
                case .downloadPending(let task):
                    return try await task.value
                case .downloaded(let image):
                    return image
            }
        }
        let task = Task {
            try await getImage(url: url)
        }
                // RICK URL                     [RICK URL : .PENDING( TASK GET IMAGE )]
        imageCache[url] = .downloadPending(task: task)
        
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
            //se podría controlar el tamaño
//            let resize = await image.byPreparingThumbnail(ofSize: CGSize(width: 300, height: 300))
            let data = image.heicData()
            try data?.write(to: cacheDirectory, options: .atomic)
            imageCache.removeValue(forKey: url)
        }
    }
}
