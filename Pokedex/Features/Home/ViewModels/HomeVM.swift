//
//  HomeVM.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 03/08/22.
//

import Foundation
import Alamofire

class HomeVM: ObservableObject {
    // MARK: - HomeView
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = true
    @Published var offset: Int = 0 // define em qual 'pagina' esta
    let itemsPerPage: Int = 50 // define quantos pokemons serao carregados
    @Published var count:Int? // conta onde que parou o carregamento
    @Published var isFavorite: Bool = false
    @Published var firstAppear: Bool = true
    var errorAlert: Bool = false
    
    // MARK: - TabBarHomeView
    @Published var showingLogout = false
    @Published var showingAlert = false
    @Published var showFavorite = false
    
    // MARK: - ProgressBarView
    let radius: CGFloat = 56.5
    var squareSide: CGFloat { 2.0.squareRoot() * radius }
    
    // MARK: - getPokemonImage
    func getPokemonImage(stringURL: String) -> String {
        let url = URL(string: stringURL)
        let id = url?.lastPathComponent
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id ?? "NA").png"
    }
    
    // MARK: - loadList/HomeView
    func loadList() {
        if offset <= count ?? itemsPerPage {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){ self.getData() }
        }
    }
    
    // MARK: - getData/HomeView
    func getData() {
        PokeApi().getData(offSet: offset) { pokemonResult in
            self.isLoading = false
            switch pokemonResult {
            case .success(let data):
                self.offset += self.itemsPerPage
                self.count = data.count
                self.pokemons += data.results ?? []
               print(self.pokemons)
            case .failure(let error):
                // mostrar pro usuario qual é o erro especifico e fazer o mesmo para pagina de detalhe
                self.errorAlert = true
                print(error)
            }
        }
    }
    
    
    // MARK: - Requests
    class PokeApi {
        func getData(offSet:Int, callback: @escaping (Result<ApiResult<Pokemon>, APIError>) -> Void) {
            AF.request("https://pokeapi.co/api/v2/pokemon?limit=50&offset=\(offSet)", method: .get).responseDecodable(of: ApiResult<Pokemon>.self, decoder: JSONDecoder()) { response in
                switch response.result {
                case .success(let data):
                    callback(.success(data))
                case .failure(let error):
                    callback (.failure(APIError.InternalError))
                    print(error)
                }
            }
        }
    }
}


