//
//  ProgressView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 12/07/22.
//

import SwiftUI

struct ProgressBarView: View {
    var value: Double
    
    var body: some View {
        VStack {
            //GeometryReader tem consciencia do proprio tamanho
        GeometryReader { ge in
            ZStack(alignment: .leading) {
                
                Capsule().frame(width: ge.size.width).foregroundColor(Color.gray)
                
                Capsule().frame(width: ge.size.width * (value/100)).foregroundColor(Color("progressColor"))
                
                Text("20")
                    .font(Font.custom("Roboto-Regular", size: 10))
                    .padding(.leading, 6)
                    .foregroundColor(.black)
            }
        }
    }
        .frame(maxWidth: .infinity)
        .frame(height: 20)
    }
  }

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: 50)
    }
}
