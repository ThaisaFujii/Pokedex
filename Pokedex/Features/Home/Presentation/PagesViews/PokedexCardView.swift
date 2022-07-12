//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct PokedexCardView: View {
    let radius: CGFloat = 56.5
    var squareSide: CGFloat {
        2.0.squareRoot() * radius
    }
    var body: some View {
            HStack {
                NavigationLink(destination: DetailView(), label:{
                    Text("Pokemon name")
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
                                
                                Image("ditto")
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .frame(width: squareSide, height: squareSide)
                                    .onTapGesture {
                                        //   isDetailViewOn = true
                                    }
                            }
                                .padding(.trailing, 230)
                        )
                }
                               
                )
            }
            .padding(44)
    }
}

struct PokedexCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCardView()
    }
}
