//
//  StatsView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 13/07/22.
//

import SwiftUI

struct StatsView: View {
    @State var listStat: [Stat]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Stats")
                .font(Font.custom("Roboto-Regular", size: 16))
                .padding(.leading, 16)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                VStack(alignment: .trailing, spacing: 12){
                    ForEach(listStat, id: \.self){ stat in 
                        Text(stat.stat?.name?.firstUppercased ?? "N/A")
                            .font(Font.custom("Roboto-Regular", size: 12))
                            .frame(height: 20)
                    }
                }
                .padding(.trailing, 16)
                VStack(spacing: 12){
                    ForEach(listStat, id: \.self){ percentage in
                        ProgressBarView(value: Double(percentage.base_stat ?? 0))
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .foregroundColor(.white)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(listStat: [])
    }
}
