//
//  HomeView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeVM()
    
    var body: some View {
        VStack(spacing: 0) {
            TabBarHomeView(isFavorite: $homeViewModel.isFavorite)
                .onChange(of: homeViewModel.isFavorite){ value in
                    if value {
                        homeViewModel.pokemons = DB_Manager().getFavoritePokemonList()
                    } else {
                        homeViewModel.offset = 0
                        homeViewModel.pokemons = []
                        homeViewModel.getData()
                    }
                }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(homeViewModel.pokemons, id: \.self) { poke in
                        NavigationLink(destination: DetailView(pokemonDetail: poke, detailStatresult: PokemonDetail()),  label: {
                            PokedexCardView(pokemon: poke)
                                .onAppear {
                                    if poke == homeViewModel.pokemons.last && homeViewModel.isFavorite == false {
                                        homeViewModel.loadList() // arrumar
                                    }
                                }
                        }
                        )}
                    if homeViewModel.isLoading {
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
            if homeViewModel.firstAppear {
                homeViewModel.firstAppear = false
                homeViewModel.getData()
            }
            if homeViewModel.isFavorite {
                homeViewModel.pokemons = DB_Manager().getFavoritePokemonList()
            }
        }
        .alert(isPresented: $homeViewModel.errorAlert){
            Alert(
            title: Text("Internal Error"),
                    message: Text("Your data was not found"))
        }
        .environmentObject(homeViewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
