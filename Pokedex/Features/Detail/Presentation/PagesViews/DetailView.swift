//
//  DetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var detailviewModel = DetailVM()
    @State var pokemonDetail: Pokemon
    @State var detailStatresult: PokemonDetail
    
    @ObservedObject var detailViewModel = DetailVM()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(pokemonCustomNavBar: pokemonDetail)
            // requisicao assincrona
            if detailViewModel.isLoading == false {
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
        .alert(isPresented: $detailviewModel.errorAlert){
            Alert(
            title: Text("Internal Error"),
                    message: Text("Your data was not found"))
        }
  }
    
    //MARK: - getPokemonDetails
    func getPokemonDetails() {
        DetailVM.PokeStatDetail().getPokemonDetails(name: pokemonDetail.name ?? "") { abilitie in
            detailViewModel.isLoading = false
            switch abilitie {
            case .success(let data):
                self.detailStatresult = data
                print(detailStatresult)
            case .failure(let error):
                // mostrar pro usuario qual é o erro especifico e fazer o mesmo para pagina de detalhe
                detailviewModel.errorAlert = true
                print(error)
            }
        }
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemonDetail: Pokemon(), detailStatresult: PokemonDetail())
    }
}
