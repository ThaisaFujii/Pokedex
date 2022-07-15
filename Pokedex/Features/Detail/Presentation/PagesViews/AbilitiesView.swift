//
//  AbilitiesView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//

import SwiftUI

struct AbilitiesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Abilities")
                .font(Font.custom("Roboto-Regular", size: 16))
                .padding(.leading, 16)
                .padding(.bottom, 8)
            // --------------------------------------
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // for each
                    Text("Abilitie name")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .padding(6)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .background(Color("abilitynameColor"))
                        .cornerRadius(45)
                        .padding(.bottom, 16)
                        .padding(.leading, 16)
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct AbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        AbilitiesView()
    }
}
