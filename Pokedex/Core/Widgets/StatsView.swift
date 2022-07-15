//
//  StatsView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 13/07/22.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Stats")
                .font(Font.custom("Roboto-Regular", size: 16))
                .padding(.leading, 16)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                VStack(alignment: .trailing, spacing: 12){
                    Text("HP")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .frame(height: 20)
                    Text("Attack")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .frame(height: 20)
                    Text("Defense")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .frame(height: 20)
                    Text("Special attack")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .frame(height: 20)
                    Text("Special Defense")
                        .font(Font.custom("Roboto-Regular", size: 12))
                        .frame(height: 20)
                }
                .padding(.trailing, 16)
                VStack(spacing: 12){
                    ProgressBarView(value: 10)
                    ProgressBarView(value: 10)
                    ProgressBarView(value: 10)
                    ProgressBarView(value: 10)
                    ProgressBarView(value: 10)
                }
            }
            .padding(.horizontal, 16)
        }
        .foregroundColor(.white)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
