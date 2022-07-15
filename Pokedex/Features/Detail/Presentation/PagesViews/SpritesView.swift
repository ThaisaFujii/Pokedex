//
//  SpritesView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//

import SwiftUI

struct SpritesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Sprites")
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .padding(.leading, 16)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
            }
            .foregroundColor(.white)
            // --------------------------------------
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // for each
                    Image("ditto")
                    Image("ditto")
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }
    }
}

struct SpritesView_Previews: PreviewProvider {
    static var previews: some View {
        SpritesView()
    }
}
