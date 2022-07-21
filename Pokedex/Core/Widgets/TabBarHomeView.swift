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
                showingAlert = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .padding(.trailing, 20)
            })
            // destino e confirmacao ao usuario sobre sair do app
            NavigationLink(destination: LoginView(), isActive: $showingLogout){}
                .confirmationDialog("Tem certeza que deseja encerrar a sessao?", isPresented: $showingAlert, titleVisibility: .visible ){
                    
                    Button("Sair"){ showingLogout = true }}
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
