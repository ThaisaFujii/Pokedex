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

            Button {
                // action
            }label: {
                Text("Enter")
                    .font(Font.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.black)
            }
            .frame(width: 140, height: 36)
            .background(Color(.green))
            .cornerRadius(78)
        }
        .foregroundColor(.white)
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            // colocAR BLUR gradiente
        )
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
