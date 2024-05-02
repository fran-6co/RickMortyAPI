//
//  URLRequest.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 2/5/24.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

extension URLRequest {
    static func get(url: URL, page: Int, method: HTTPMethod = .get) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(59)
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        return request
    }
}
