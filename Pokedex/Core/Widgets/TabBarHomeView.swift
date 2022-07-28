//
//  TabBarView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct TabBarHomeView: View {
    @State var showingLogout = false
    @State var showingAlert = false
    @State var showFavorite = false
    @Binding var isFavorite: Bool
    
    var body: some View {
        HStack {
            Text("Pokedex")
                .font(Font.custom("Roboto-Medium", size: 22))
                .foregroundColor(.white)
                .padding(.leading, 16)
            Spacer()
                    HStack {
                            Image(isFavorite == true ? "read-heart" : "heart")
                                .onTapGesture {
                                    isFavorite.toggle()
                                    
                                }
                    }
            .padding(.trailing, 22)
            //botao para sair do app
            Button(action: {
                showingAlert = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .accentColor(.white)
                    .padding(.trailing, 20)
            })
            // destino e confirmacao ao usuario sobre sair do app
            NavigationLink(destination: LoginView(), isActive: $showingLogout){}
                .confirmationDialog("Are you sure you want to logout?", isPresented: $showingAlert, titleVisibility: .visible ){
                    
                    Button("Logout"){ showingLogout = true }}
        }
        .padding(.top, 42)
        .padding(.bottom, 18)
        .frame(maxWidth: .infinity)
        .background(Color("toolBarColor").ignoresSafeArea(edges: .all))
        .shadow(color: .black .opacity(0.2), radius: 0.4, x: 0, y: 2)
    }
}

struct TabBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHomeView(isFavorite: .constant(false))
    }
}
