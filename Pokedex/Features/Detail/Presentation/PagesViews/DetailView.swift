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
    @State var pokemonDetail: Pokemon
    @State var detailStatresult: PokemonDetail
    @State var isLoading: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(pokemonCustomNavBar: pokemonDetail)
            // requisicao assincrona
            if isLoading == false {
                ScrollView {
                    ImageDetailView(pokemonImage: pokemonDetail)
                    // ----------------------------------------
                    VStack(alignment: .leading) {
                        AbilitiesView(abilitiesList: detailStatresult.abilities ?? [])
                        // ----------------------------------
                        StatsView(listStat: detailStatresult.stats ?? [])
                        // ------------------------------
                        SpritesView(listSprite: detailStatresult.sprites ?? Sprites())
                    }
                }
                .background(Color("backgroundColor"))
            } else {
                ProgressView()
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .onAppear {
            getPokemonDetails()
            DB_Manager().verifiedIfPokemonIsFavorite(pokemonName: pokemonDetail.name ?? "")
        }
    }
    
    func getPokemonDetails() {
        PokeStatDetail().getPokemonDetails(name: pokemonDetail.name ?? "") { abilitie in
            isLoading = false
            if let abilitie = abilitie {
                self.detailStatresult = abilitie
                print(detailStatresult)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemonDetail: Pokemon(), detailStatresult: PokemonDetail())
    }
}
