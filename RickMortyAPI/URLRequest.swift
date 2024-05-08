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
    static func get(url: URL, page: Int, name: String, gender: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = TimeInterval(59)
        request.url?.append(queryItems: [.page(pageNumber: page), .name(name: name), .gender(gender: gender)])
        print(request)
        return request
    }
}

extension URLQueryItem {
    static func page(pageNumber: Int) -> URLQueryItem {
        URLQueryItem(name: "page", value: String(pageNumber))
    }
    static func name(name: String) -> URLQueryItem {
        URLQueryItem(name: "name", value: name)
    }
    static func gender(gender: String) -> URLQueryItem {
        URLQueryItem(name: "gender", value: gender)
    }
}
