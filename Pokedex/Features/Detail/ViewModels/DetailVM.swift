//
//  DetailVM.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 03/08/22.
//

import Foundation
import Alamofire

class DetailVM: ObservableObject {
    // MARK: - DetailView
    @Published var isLoading: Bool = true
    var errorAlert: Bool = false
     
    // MARK: - getPokemonImage
    func getPokemonImage(stringURL: String) -> String {
        let url = URL(string: stringURL)
        if let url = url {
            let id = url.lastPathComponent
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        } else {
            return "https://www.ifms.edu.br/imagens/icones-agenda/interrogacao.png/@@images/4201dd79-8751-48ca-945f-92d2c815f7ca.png"
        }
    }
    
    // MARK: - Requests
    class PokeStatDetail {
        func getPokemonDetails(name: String, callback: @escaping (Result<PokemonDetail, APIError>) -> Void) {
            AF.request("https://pokeapi.co/api/v2/pokemon/\(name)", method: .get).responseDecodable(of: PokemonDetail.self, decoder: JSONDecoder()){ response in
                switch response.result {
                case .success(let data):
                    callback (.success(data))
                    print(data)
                case .failure(let error):
                    print("Ocorreu um \(error), por favor verifique")
                    callback (.failure(APIError.InternalError))
                }
            }
        }
    }
}
