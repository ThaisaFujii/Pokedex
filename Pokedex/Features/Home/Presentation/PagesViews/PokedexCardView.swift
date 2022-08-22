//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct PokedexCardView: View {
    @State var pokemon: Pokemon
    @EnvironmentObject var homeViewModel: HomeVM
    
    var body: some View {
        HStack {
                        Text(pokemon.name?.firstUppercased ?? "N/A")
                        .font(Font.custom("Roboto-Bold", size: 12))
                        .foregroundColor(.white)
                        .padding(30)
                        .frame(width: 272, height: 90)
                        .background(Color("toolBarColor"))
                        .cornerRadius(20)
                        .padding(.leading, 73)
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color("circleColor"))
                                    .frame(width: homeViewModel.radius * 2, height: homeViewModel.radius * 2)
                                if pokemon.url != nil {
                                AsyncImage(
                                    url: URL(string: homeViewModel.getPokemonImage(stringURL: pokemon.url ?? "")),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(1.0, contentMode: .fit)
                                            .frame(width: homeViewModel.squareSide, height: homeViewModel.squareSide)
                                    },
                                    placeholder: {
                                        ProgressView()
                                    }
                                )
                                } else {
                                    Image(systemName: "nosign")
                                        .font(Font.system(size: 100))
                                }
                            }
                                .padding(.trailing, 230)
                        )
        }
        .padding(22)
        .padding(.top, 10)
        .shadow(color: .black, radius: 0.2, x: 0, y: 2)
    }
}

struct PokedexCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCardView(pokemon: Pokemon())
    }
}
