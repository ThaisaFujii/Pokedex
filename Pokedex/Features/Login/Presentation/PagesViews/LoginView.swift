//
//  LoginView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

import SwiftUI
import iPhoneNumberField //https://iosexample.com/elegant-swiftui-phone-number-textfield/#examples

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginVM()
    
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
                    if loginViewModel.text.isEmpty {
                        Text("(xx) xxxx-xxxx", comment: "Field for the input of phone number to login")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    iPhoneNumberField("", text: $loginViewModel.text)
                        .font(UIFont(size: 12, weight: .medium, design: .init(rawValue: "Roboto-Medium")))
                }
                .modifier(TextFieldStyle())
                
                ZStack(alignment: .leading) {
                    if loginViewModel.password.isEmpty {
                        Text("Password", comment: "Field for the input of password to login")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    SecurityView(text: $loginViewModel.password)
                        .foregroundColor(.black)
                }
                .modifier(TextFieldStyle())
            }
            .padding(32)
            NavigationLink(destination: HomeView(), isActive: $loginViewModel.verified){}
            Button(action: {
                loginViewModel.isLoading = true
                print(loginViewModel.isLoading)
                print(loginViewModel.isCredentialValid())
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){ loginViewModel.isCredentialValid() }
            }, label: {
                if loginViewModel.isLoading {
                    HStack {
                        Spacer()
                        Text("Validating ...")
                            .font(Font.custom("Roboto-Medium", size: 12))
                            .opacity(0.7)
                            .foregroundColor(.black)
                        Spacer()
                    }
                } else {
                    Text("Enter", comment: "Button for verification of the login information")
                        .font(Font.custom("Roboto-Medium", size: 12))
                        .foregroundColor(.black)
                }
            })
            .disabled(loginViewModel.text.isEmpty || loginViewModel.password.isEmpty)
            .alert(isPresented: $loginViewModel.showingAlert) {
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
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .background(
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [Color("linearGratient").opacity(0), .black]), startPoint: .top, endPoint: .bottom)
            }
        ).ignoresSafeArea()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
