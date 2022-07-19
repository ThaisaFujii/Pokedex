//
//  ImageDetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//


import SwiftUI

struct ImageDetailView: View {
    // criar uma funcao getSprite, pegar imagem
    // AsyncImage(url:)
    // UserDefault
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image("ditto")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 24)
                .padding(.bottom, 23)
        }
    }
    
    func getPokemonImage(stringURL: String) -> String {
        let url = URL(string: stringURL)
        
        if let url = url {
            let id = url.lastPathComponent
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        } else {
            return "https://www.ifms.edu.br/imagens/icones-agenda/interrogacao.png/@@images/4201dd79-8751-48ca-945f-92d2c815f7ca.png"
        }
    }

}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView()
    }
}
