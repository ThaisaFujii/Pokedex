//
//  TabBarView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//

import SwiftUI

struct TabBarHomeView: View {
    @EnvironmentObject var homeViewModel: HomeVM
    @Binding var isFavorite: Bool
    
    var body: some View {
        HStack {
            Text("Pokedex")
                .modifier(TabBarStyle())
                .padding(.leading, 16)
            Spacer()
                    HStack {
                            Image(isFavorite == true ? "read-heart" : "heart")
                                .onTapGesture {
                                    isFavorite.toggle()
                                }
                    }
            .padding(.trailing, 22)

            Button(action: {
                homeViewModel.showingAlert = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .accentColor(.white)
                    .padding(.trailing, 20)
            })

            NavigationLink(destination: LoginView(), isActive: $homeViewModel.showingLogout){}
                .confirmationDialog("Are you sure you want to logout?", isPresented: $homeViewModel.showingAlert, titleVisibility: .visible ){
                    
                    Button("Logout"){
                        UserDefaults.standard.set(false, forKey: "isLoggedIn")
                        homeViewModel.showingLogout = true
                    }}
        }
        .padding(.top, 42)
        .modifier(TabBarBackgroundStyle())
    }
}

struct TabBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHomeView(isFavorite: .constant(false))
    }
}
