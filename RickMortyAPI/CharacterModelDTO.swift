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
struct RMCharacterDTO: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let image: URL
    let episode: [String]
    let created: String
}

enum Gender: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    case all = "All"
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

// MARK: - Location
enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case humanoid = "Humanoid"
    case mythologicalCreature = "Mythological Creature"
    case animal = "Animal"
    case robot = "Robot"
    case poopybutthole = "Poopybutthole"
    case cronenberg = "Cronenberg"
    case disease = "Disease"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
