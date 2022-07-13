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
    var body: some View {
        NavigationView {
        VStack(spacing: 0) {
            TabBarHomeView()
            ScrollView {
                VStack(alignment: .leading) {
                    // foreach list
                    ZStack {
                        PokedexCardView()
                    }
                }
            }
        }
        .background(Color("backgroundColor"))
        .navigationTitle("Pokemon name")
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }

  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
