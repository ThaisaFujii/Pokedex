//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct PokedexCardView: View {
    @State var pokemon: Pokemon
    let radius: CGFloat = 56.5
    var squareSide: CGFloat { 2.0.squareRoot() * radius }
    
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
                                    .frame(width: radius * 2, height: radius * 2)
                                if pokemon.url != nil {
                                AsyncImage( // arrumar quando carrega a imagem ou n acha
                                    url: URL(string: getPokemonImage(stringURL: pokemon.url ?? "")),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(1.0, contentMode: .fit)
                                            .frame(width: squareSide, height: squareSide)
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
    
    func getPokemonImage(stringURL: String) -> String {
        let url = URL(string: stringURL)
        let id = url?.lastPathComponent
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id ?? "NA").png"
    }
}

struct PokedexCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCardView(pokemon: Pokemon())
    }
}
