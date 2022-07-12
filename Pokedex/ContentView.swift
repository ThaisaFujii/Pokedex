//
//  ContentView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
//

import SwiftUI

struct ContentView: View {
//    let image = Image("background")
    var body: some View {
        HomeView()
//        AsyncImage(url: image, content: view)
    }
}

//@ViewBuilder
//   private func view(for phase: AsyncImagePhase) -> some View {
//       switch phase {
//       case .empty:
//           ProgressView()
//       case .success(let image):
//           image
//               .resizable()
//               .aspectRatio(contentMode: .fit)
//       case .failure(let error):
//           VStack(spacing: 16) {
//               Image(systemName: "xmark.octagon.fill")
//                   .foregroundColor(.red)
//               Text(error.localizedDescription)
//                   .multilineTextAlignment(.center)
//           }
//       @unknown default:
//           Text("Unknown")
//               .foregroundColor(.gray)
//       }
//   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
