//
//  DetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

/*
 
 
 ------------------------------------------------------------------------------
 Call api and load pokemon details
 Clicking on favorite icon set/unset favorite to this pokemon.
 All the project needs to be translated to portuguese and english
 */
import SwiftUI

struct DetailView: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0) {
                HStack {
//                    Text("Pokemon Name")
//                        .font(Font.custom("Roboto-Medium", size: 22))
//                        .foregroundColor(.white)
//                        .padding(.leading, 16)
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                        Image("heart")
                            .padding(.trailing, 28)
                    })
                }
                .padding(.bottom, 18)
                .frame(maxWidth: .infinity)
                .background(Color("toolBarColor").ignoresSafeArea(edges: .all))
                .shadow(color: .black .opacity(0.2), radius: 0.4, x: 0, y: 2)
                
                ScrollView {
                    VStack(alignment: .center) {
                        Image("ditto")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(.top, 24)
                            .padding(.bottom, 23)
                    }
                    // ----------------------------------------
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
                        // ----------------------------------
                        StatsView()
                        // ------------------------------
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
            .background(Color("backgroundColor"))
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
