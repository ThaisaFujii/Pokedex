//
//  StyleModifiers.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 02/08/22.
//

import Foundation
import SwiftUI

struct LoginTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Medium", size: 24))
            .multilineTextAlignment(.center)
    }
}

struct LoginSubTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Medium", size: 12))
            .multilineTextAlignment(.center)
    }
}

struct PhoneFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.decimalPad)
            .font(Font.custom("Roboto-Medium", size: 12))
            .padding(12)
            .background(Color.white)
            .cornerRadius(12)
    }
}

struct LoginAlertStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 140, height: 36)
            .background(Color(.green))
            .cornerRadius(78)
            .padding(.bottom, 46)
            .padding(.top, 16)
    }
}

struct LoginScreenStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
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
}

