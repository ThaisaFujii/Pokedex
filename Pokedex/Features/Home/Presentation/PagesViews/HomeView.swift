//
//  HomeView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//
/*
 HOME
 Fazer um toolbar com titulo e dois botoes no topo
 Fazer com que a cor seja igual do figma
 Fazer com que a safearea tenha a mesma cor
 Fazer infinity scrollview, carregando 50 pokemons por pagina
 
 ------------------------------------------------------------------
 Load the pokemons from api with a loading on the screen and show all the default pictures using the url
 Clicking on favorite icon show only the favorited pokemons, clicking again show all the pokemon.
 favorite pokemons are saved on local storage.
 Clicking on logout icon logoff the user back to login screen.
 Use infinity scroll loading 50 pokemons per page
 */
import SwiftUI

struct HomeView: View {
    @State var pokemons: [Pokemon] = []
    @State var isLoading: Bool = true
    @State var offset: Int = 0 // define em qual 'pagina' esta
    let itemsPerPage: Int = 50 // define quantos pokemons serao carregados
    @State var count:Int? // conta onde que parou o carregamento
    @State var isFavorite: Bool = false
    @State var firstAppear: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            TabBarHomeView(isFavorite: $isFavorite)
                .onChange(of: isFavorite){ value in
                    if value {
                        pokemons = DB_Manager().getFavoritePokemonList()
                        print("favoritos")
                    } else {
                        offset = 0
                        pokemons = []
                        getData()
                        print("lista normal")
                    }
                }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(pokemons, id: \.self) { poke in
                        NavigationLink(destination: DetailView(pokemonDetail: poke, detailStatresult: PokemonDetail()), label: {
                            PokedexCardView(pokemon: poke)
                                .onAppear {
                                    if poke == pokemons.last && isFavorite == false {
                                        loadList() // arrumar
                                    }
                                }
                        }
                        )}
                    if isLoading {
                        HStack {
                            Spacer()
                        ProgressView("Loading") // centralizar no meio da tela, deixar branco
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            Spacer()
                        }
                    }
                }
            }
        }
        .background(Color("backgroundColor"))
        .navigationTitle("Pokemon name")
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .onAppear {
            if firstAppear {
                firstAppear = false
                getData()
            }
            if isFavorite {
                pokemons = DB_Manager().getFavoritePokemonList()
            }
        }
    }
    
    func loadList() {
        if offset <= count ?? itemsPerPage {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){getData()}
            
        }
    }
    
    func getData() {
        PokeApi().getData(offSet: offset) { pokemonResult in
            isLoading = false
            if let pokemonResult = pokemonResult {
                offset += itemsPerPage
                count = pokemonResult.count
                self.pokemons += pokemonResult.results ?? []
                print(pokemons)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
