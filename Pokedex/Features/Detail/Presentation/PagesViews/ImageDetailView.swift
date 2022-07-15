//
//  ImageDetailView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//

import SwiftUI

struct ImageDetailView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("ditto")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 24)
                .padding(.bottom, 23)
        }
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView()
    }
}
