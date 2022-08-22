//
//  PokemonDetailModels.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 03/08/22.
//

import Foundation

// MARK: - PokemonList
struct PokemonDetail: Codable {
    var abilities: [Ability]?
    var sprites: Sprites?
    var stats: [Stat]?
}
// MARK: - Extension
extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}

// MARK: - Ability
struct Ability: Codable, Hashable {
    var slot: Int?
    var ability: AbilityInfo?
}

struct AbilityInfo: Codable, Hashable {
    var name: String?
    var url: String?
}

// MARK: - Sprites
struct Sprites: Codable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
}

// MARK: - Stat
struct Stat: Codable, Hashable {
    var base_stat, effort: Int?
    var stat: StatInfo?
}

// MARK: - StatInfo
struct StatInfo: Codable, Hashable {
    var name: String?
    var url: String?
}


