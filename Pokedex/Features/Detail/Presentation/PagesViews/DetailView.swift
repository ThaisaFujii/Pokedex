//
//  DetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

/*
 
 
 ------------------------------------------------------------------------------
 Call api and load pokemon details
 Clicking on favorite icon set/unset favorite to this pokemon.
 All the project needs to be translated to portuguese and english
 */
import SwiftUI

struct DetailView: View {
    let pokemonDetail: Pokemon

    /*
     FAZER O HEADER PERSONALIZADO
     NOME VEM DO BACKEND
     IMAGEM VEM DO BACKEND
     SPRITES ROLAGEM DE IMAGENS
     */
    
    var body: some View {
            VStack(spacing: 0) {
                CustomNavBarView(pokemonCustomNavBar: pokemonDetail)
                ScrollView {
                    ImageDetailView(pokemonImage: pokemonDetail)
                    // ----------------------------------------
                    VStack(alignment: .leading) {
                        AbilitiesView()
                        // ----------------------------------
                        StatsView()
                        // ------------------------------
                        SpritesView()
                        
                    }
                }
                .background(Color("backgroundColor"))
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .onAppear {
              //  pokemonImage = getPokemonImage(stringURL: pokemonDetail.url ?? " ")
            }
    }
    
    func getPokemonDetails() {
        // fazer requisicao dos detalhes/habilidades
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemonDetail: Pokemon())
    }
}
