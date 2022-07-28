//
//  ContentView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 08/07/22.
// Animation - https://www.youtube.com/watch?v=K00oSg1gm_0
// https://www.youtube.com/watch?v=0ytO3wCRKZU - SwiftUI

import SwiftUI

struct ContentView: View {
    
    // Animaton Properties...
    @State var size = 0.3
    @State var opacity = 0.5
    
    // Logic Verification
    @State var isFinished = false
    
    var body: some View {
        NavigationView {
            if isFinished {
                LoginView()
            } else {
                VStack{
                    VStack {
                        Image("LaunchScreen")
                            .font(.system(size: 30))
                        //  .resizable()
                            .scaledToFill()
                        //   .ignoresSafeArea(.all)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.linear(duration: 2)){
                            self.size = 1.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isFinished = true
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


