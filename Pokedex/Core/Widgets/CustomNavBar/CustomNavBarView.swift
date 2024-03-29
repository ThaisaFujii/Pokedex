//
//  CustomNavBarView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 13/07/22.
//
import SwiftUI

struct CustomNavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var pokemonCustomNavBar: Pokemon
    @State var isFavorite = false
    
    var body: some View {
        HStack {
            backButton
            Spacer()
            titleSection
            Spacer()
        }
        .modifier(TabBarBackgroundStyle())
    }
}
// custom subview
extension CustomNavBarView {
    private var backButton: some View {
        NavigationLink(destination: HomeView(), label: {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left") // mudar cor
                    .accentColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 42)
            })
        })
    }

    
    private var titleSection: some View {
        VStack(spacing: 0) {
            HStack {
                Text(pokemonCustomNavBar.name?.firstUppercased ?? "NA")
                    .modifier(TabBarStyle())
                    .padding(.leading, 20)
                    .padding(.top, 42)
                Spacer()
                Image(isFavorite == true ? "read-heart" : "heart").onTapGesture {
                    isFavorite.toggle()
                    if isFavorite == true {
                        DB_Manager().addFavoritePokemon(pokemon: pokemonCustomNavBar)
                    } else {
                        DB_Manager().deletePokemon(pokemon: pokemonCustomNavBar)
                    }
                }
                .padding(.top, 42)
                .padding(.trailing, 22)
            }
        }
        .foregroundColor(.white)
        .onAppear {
            if DB_Manager().verifiedIfPokemonIsFavorite(pokemonName: pokemonCustomNavBar.name ?? "") == true {
                isFavorite = true
            }
        }
    }
}


struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView(pokemonCustomNavBar: Pokemon())
        Spacer()
    }
}
