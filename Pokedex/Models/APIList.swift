//
//  APIList.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 18/07/22.


import Foundation


// MARK: - APIResult Model
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






