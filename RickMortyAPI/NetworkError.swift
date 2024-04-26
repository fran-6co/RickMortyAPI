//
//  NetworkError.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 26/4/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case nonHTTP, badStatusCode(Int)
    var errorDescription: String {
        switch self {
            case .nonHTTP:
                "No es una conexión HTTP."
            case .badStatusCode(let statusCode):
                "Error de status \(statusCode)"
        }
    }
}
