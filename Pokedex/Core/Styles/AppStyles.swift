//
//  LoginModifiers.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 02/08/22.
//

import Foundation
import SwiftUI


struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.decimalPad)
            .font(Font.custom("Roboto-Medium", size: 12))
            .padding(12)
            .background(Color.white)
            .cornerRadius(12)
    }
}

struct TabBarStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Medium", size: 22))
            .foregroundColor(.white)
    }
}

struct TabBarBackgroundStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 18)
            .frame(maxWidth: .infinity)
            .background(Color("toolBarColor").ignoresSafeArea(edges: .all))
            .shadow(color: .black .opacity(0.2), radius: 0.4, x: 0, y: 2)
    }
}
