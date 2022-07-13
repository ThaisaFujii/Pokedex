//
//  LoginView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//
/*
 LOGIN
 1. Pegar imagem de background e colocar no assets
 2. Fazer um titulo e um subtitulo
 3. TextFields - telefone/password
 4. Botao
 5. Setar os paddings, cores e fonts customizadas
 6. Fazer validacao das credenciais
 7. Fazer isloading no botao(assincrono), alterar o text dele
 
 ----------------------------------------------------------------
 PART 01
 On start the app detect if the user has logged before and
 move to next screen instead to open the login page.
 Mask the phone.
 Disable button if phone or password is empty.
 After login completed save the login state and keep the user
 logged until the user logout.
 
 --------------------------------------------------------------
 PART 02
 Show a loading state when user click on ‘enter’ and validate
 the informations before continue.
 Phone to login: Anyone with correctly format
 Password to login: 123456
 Show error message if the user typed an incorrect credential
 
 */

// fazer gradiente no bottom

import SwiftUI

struct LoginView: View {
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var login:String = "" //encapsular
    @State var showingAlert = false
    @State var verified = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to pokedex")
                .font(Font.custom("Roboto-Medium", size: 24))
                .multilineTextAlignment(.center)
            Text("Enter your login information")
                .font(Font.custom("Roboto-Medium", size: 12))
                .multilineTextAlignment(.center)
            HStack(spacing: 12) {
                TextField("(xx) xxxx-xxxx", text: $phoneNumber)
                    .keyboardType(.decimalPad)
                    .font(Font.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.black).opacity(0.5)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(12)
                
                TextField("Password", text: $password)
                    .font(Font.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.black).opacity(0.5)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(12)
            }
            .padding(32)
            
            NavigationLink(destination: HomeView(), isActive: $verified){} //criar navigation vazio
            Button(action: {
                isCredentialValid()
            }, label: {
                Text("Enter")
                    .font(Font.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.black)
            })
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("As informações não são válidas."),
                    message: Text("Por favor colocar o login e a senha")
                )
            }
            .frame(width: 140, height: 36)
            .background(Color(.green))
            .cornerRadius(78)
            .padding(.bottom, 46)
            .padding(.top, 16)
        }
        .foregroundColor(.white)
        .background(
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                // colocar assets color
                LinearGradient(gradient: Gradient(colors: [Color("linearGratient").opacity(0), .black]), startPoint: .top, endPoint: .bottom)
            }
        ).ignoresSafeArea()
    }
    
    //app deve exibir um alerta dizendo que as informações não são válidas.
    func isCredentialValid() {
        if login == "19971144383" && password == "Thais@2022" {
            verified = true
        } else {
            showingAlert = true
        }
    }
    
}

/*
 
 struct TextFieldStyle: ViewModifier {
 func body(content: Content) -> some View {
 content
 .font(Font.custom("Gilroy-Bold", size: 16))
 .padding(16)
 .overlay(
 RoundedRectangle(cornerRadius: 14)
 .stroke(Color("ThinGray"), lineWidth: 1)
 )
 .frame(width: 50, height: 50)
 }
 }
 
 */
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
