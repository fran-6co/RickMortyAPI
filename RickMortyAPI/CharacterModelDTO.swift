//
//  CharacterModelDTO.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/4/24.
//

import Foundation

// MARK: - Welcome
struct CharacterResponseDTO: Codable {
    let info: Info
    let results: [RMCharacterDTO]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct RMCharacterDTO: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let image: URL
    let episode: [String]
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
