//
//  APIList.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 18/07/22.
//https://pokeapi.co/api/v2/pokemon?limit=50&offset=0
//    var url: String //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{id}.png


import Foundation
import Alamofire

// ------------ MODEL ------------
struct ApiResult<T: Codable>: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
}

// MARK: - Pokemon
struct Pokemon: Codable, Identifiable, Hashable {
    var id : String? = UUID().uuidString
    var name: String?
    var url: String?
    var isFavorite: Bool?
}

// MARK: - PokemonList
struct PokemonDetail: Codable {
    var abilities: [Ability]?
    var sprites: Sprites?
    var stats: [Stat]?
}
// MARK: - Extensao
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

// MARK: - Requisicoes
class PokeApi {
    func getData(offSet:Int ,callback: @escaping (ApiResult<Pokemon>?) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=50&offset=\(offSet)", method: .get).responseDecodable(of: ApiResult<Pokemon>.self, decoder: JSONDecoder()){ response in
            switch response.result {
            case .success(let data):
                callback(data)
                print(data)
            case .failure(let error):
                print("Ocorreu um \(error), por favor verifique")
            }
        }
    }
}

class PokeStatDetail {
    func getPokemonDetails(name: String, callback: @escaping(PokemonDetail?) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon/\(name)", method: .get).responseDecodable(of: PokemonDetail.self, decoder: JSONDecoder()){ response in
            switch response.result {
            case .success(let data):
                callback(data)
                print(data)
            case .failure(let error):
                print("Ocorreu um \(error), por favor verifique")
            }
        }
    }
}


