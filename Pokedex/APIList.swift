//
//  APIList.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 18/07/22.
//https://pokeapi.co/api/v2/pokemon?limit=50&offset=0


//struct Pokemon: Codable {
//    var results: [PokemonList]
//}
//
//struct PokemonList: Codable {
//   // var id = UUID() // usar por causa do foreach
//    var name: String
//    var url: String //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{id}.png
//}

import Foundation
import Alamofire

// ------------ MODEL ------------
struct ApiResult<T: Codable>: Codable {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
}

struct Pokemon: Codable, Identifiable, Hashable {
    var id : String? = UUID().uuidString
    var name: String?
    var url: String?
    
}
// ------------ MODEL ------------

class PokeApi {
    // construir funcao generica 
    func getData(callback: @escaping (ApiResult<Pokemon>?) -> Void) {
        
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=50&offset=0", method: .get).responseDecodable(of: ApiResult<Pokemon>.self, decoder: JSONDecoder()){ response in
       //     self.isLoading = false
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

/*
 func getData(callback: @escaping([ApiResult]) -> ()) {
 guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto") else {
     return
 }
 // https://pokeapi.co/api/v2/pokemon/1/ como pegar id da string
 // https://pokeapi.co/api/v2/pokemon/10/ item especifico
URLSession.shared.dataTask(with: url) { data, response, error in
 
 guard let data = data, error == nil else { return }

 let pokemonList = try! JSONDecoder().decode(ApiResult.self, from: data)

//            DispatchQueue.main.async {
//                callback(pokemonList.results)
//            }
}.resume()
}
 
 func getCoinItem(id:String, callback: @escaping (Coin) -> Void){
     // injetar erro no coins p teste
     AF.request("\(Constants.API)coins/\(id)", method: .get).responseDecodable(of: Coin.self, decoder: JSONDecoder()){ response in // callback
         self.isLoading = false
         switch response.result {
         case .success(let data):
             self.isCompleted = true
             callback(data)
             print(data)
         case .failure(let error):
             print(error)
         }
     }
 }
 
 */
