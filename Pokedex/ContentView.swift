//
//  ContentView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoggedIn {
                    HomeView()
                } else {
                   LoginView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


