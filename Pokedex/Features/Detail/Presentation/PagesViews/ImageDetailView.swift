//
//  ImageDetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//


import SwiftUI

struct ImageDetailView: View {
    @State var pokemonImage: Pokemon
    @ObservedObject var detailViewModel = DetailVM()
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage( 
                url: URL(string: detailViewModel.getPokemonImage(stringURL: pokemonImage.url ?? "")),
                content: { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                        .padding(.top, 24)
                        .padding(.bottom, 23)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(pokemonImage: Pokemon())
    }
}
