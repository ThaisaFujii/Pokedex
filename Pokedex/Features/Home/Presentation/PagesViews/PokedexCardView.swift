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
                        Text(pokemon.name ?? "NA")
                        .font(Font.custom("Roboto-Bold", size: 12))
                        .foregroundColor(.white)
                        .padding(28)
                        .frame(width: 270, height: 85)
                        .background(Color("toolBarColor"))
                        .cornerRadius(20)
                        .padding(.leading, 73)
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color("circleColor"))
                                    .frame(width: radius * 2, height: radius * 2)
                                
                                AsyncImage( // arrumar quando carrega a imagem ou n acha
                                    url: URL(string: getPokemonImage(stringURL: pokemon.url ?? "")),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(1.0, contentMode: .fit)
                                            .frame(width: squareSide, height: squareSide)
                                    },
                                    placeholder: {
                                        Image(systemName: "x.square")
                                            .font(Font.system(size: 200))
                                    }
                                ) // usar url pra atualizar id
                                    
                            }
                                .padding(.trailing, 230)
                        )
        }
        .padding(44)
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
