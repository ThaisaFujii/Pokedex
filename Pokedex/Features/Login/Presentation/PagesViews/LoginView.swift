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
    @State var phoneNumber: String = "" //encapsular
    @State var password: String = ""
    @State var showingAlert = false
    @State var verified = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to pokedex", comment: "Title of welcoming to the app")
                .font(Font.custom("Roboto-Medium", size: 24))
                .multilineTextAlignment(.center)
            Text("Enter your login information", comment: "Subtitle asking for login information")
                .font(Font.custom("Roboto-Medium", size: 12))
                .multilineTextAlignment(.center)
            HStack(spacing: 12) {
                ZStack(alignment: .leading) {
                    if phoneNumber.isEmpty {
                        Text("(xx) xxxx-xxxx", comment: "Field for the input of phone number to login")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    TextField("", text: $phoneNumber)
                        .foregroundColor(.black)
                }
                .keyboardType(.decimalPad)
                .font(Font.custom("Roboto-Medium", size: 12))
                .padding(12)
                .background(Color.white)
                .cornerRadius(12)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password", comment: "Field for the input of password to login")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    SecurityView(text: $password)
                        .foregroundColor(.black)
                }
                .font(Font.custom("Roboto-Medium", size: 12))
                .padding(12)
                .background(Color.white)
                .cornerRadius(12)
            }
            .padding(32)
            
            
            NavigationLink(destination: HomeView(), isActive: $verified){} //criar navigation vazio
            Button(action: {
                isCredentialValid()
            }, label: {
                Text("Enter", comment: "Button for verification of the login information")
                    .font(Font.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.black)
            })
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("The information is not valid.", comment: "Alert message to the user, something went wrong"),
                    message: Text("Please use the correct login and password.", comment: "The information used is incorrect, try again")
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
        if phoneNumber == "19971144383" && password == "123456" {
            verified = true
        } else {
            showingAlert = true
        }
    }
    
}

 
 struct TextFieldStyle: ViewModifier {
 func body(content: Content) -> some View {
 content
         .font(Font.custom("Roboto-Medium", size: 12))
         .padding(12)
         .background(Color.white)
         .cornerRadius(12)
    }
 }
 

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
