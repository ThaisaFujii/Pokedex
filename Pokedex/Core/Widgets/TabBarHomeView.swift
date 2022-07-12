//
//  TabBarView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct TabBarHomeView: View {
    var body: some View {
        HStack {
            Text("Pokedex")
                .font(Font.custom("Roboto-Medium", size: 22))
                .foregroundColor(.white)
                .padding(.leading, 16)
            Spacer()
            Button(action: {
                //
            }, label: {
                Image("heart")
                    .padding(.trailing, 28)
            })
            //botao para sair do app
            Button(action: {
                //   bemvindoviewmodel.showingAlert = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .padding(.trailing, 22)
            })
        // destino e confirmacao ao usuario sobre sair do app
        //Navigation
        //  Button("Sair"){logica booleana}}
        }
        .padding(.bottom, 18)
        .frame(maxWidth: .infinity)
        .background(Color("toolBarColor").ignoresSafeArea(edges: .all))
        .shadow(color: .black .opacity(0.2), radius: 0.4, x: 0, y: 2)
    }
}

struct TabBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHomeView()
    }
}
