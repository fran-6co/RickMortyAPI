//
//  NetworkInteractor.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 30/4/24.
//

import Foundation

protocol NetworkInteractor {
    var session: URLSession { get }
}

extension NetworkInteractor {
    func getJSONfromData<T>(request: URLRequest, type: T.Type) async throws -> T where T: Codable {
        let (data, response) = try await session.getData(request: request)
        
        guard response.statusCode == 200 else {
            throw NetworkError.badStatusCode(response.statusCode)
        }
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.decodingJSONerror(error)
        }
    }
}
