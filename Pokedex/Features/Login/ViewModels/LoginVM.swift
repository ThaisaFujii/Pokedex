//
//  LoginVM.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 02/08/22.
//

import Foundation

class LoginVM: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var text: String = ""
    @Published var password: String = ""
    @Published var showingAlert: Bool = false
    @Published var verified: Bool = false
    
    //app deve exibir um alerta dizendo que as informações não são válidas.
    func isCredentialValid() {
        if text == "19 97114-4383" && password == "123456" {
            verified = true
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
        } else {
            showingAlert = true
        }
    }
}
