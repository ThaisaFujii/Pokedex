//
//  SecurityView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 11/07/22.
//
// verifica se eh um campo security
// TESTAR no securite field https://stackoverflow.com/questions/30403550/how-can-i-change-the-dots-to-another-character-on-password-field-in-ios-swift
// https://stackoverflow.com/questions/62047404/how-to-make-secure-text-field-dots-as-custom-in-swift
//https://stackoverflow.com/questions/30403550/how-can-i-change-the-dots-to-another-character-on-password-field-in-ios-swift


import SwiftUI

struct SecurityView: View {

    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
            if isSecureField {
                SecureField("", text: $text)
            } else {
                TextField(text, text: $text)
            }
          }
        .font(Font.custom("Poppins-Regular", size: 12))
            
//        Image(isSecureField ? "eye.slash": "Eye")// trocar imagem figma
//                .onTapGesture {
//                    isSecureField.toggle()
//                }
        }
      }
    }
    
    struct SecurityView_Previews: PreviewProvider {
        static var previews: some View {
            SecurityView(text: .constant("valor"))
        }
    }
