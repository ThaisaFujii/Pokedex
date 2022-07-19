//
//  CustomNavBarView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 13/07/22.
//

/*
 https://www.youtube.com/watch?v=aIDT4uuMLHc
 */
import SwiftUI

struct CustomNavBarView: View {
    @Environment(\.presentationMode) var presentationMode
 //   let subtitle: String?
    
    var body: some View {
        HStack {
                backButton
            Spacer()
            titleSection
            Spacer()
        }
        .padding(.bottom, 18)
        .frame(maxWidth: .infinity)
        .background(Color("toolBarColor").ignoresSafeArea(edges: .all))
        .shadow(color: .black .opacity(0.2), radius: 0.4, x: 0, y: 2)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView()
        Spacer()
    }
}

// custom subview
extension CustomNavBarView {
    
    private var backButton: some View {
        NavigationLink(destination: HomeView(), label: {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .padding(.leading, 20)
                    .padding(.top, 42)
            })
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Pokemon Name")
                    .font(Font.custom("Roboto-Medium", size: 22))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 42)
                //  if let subtitle = subtitle {
                Spacer()
                Button(action: {
                    //
                }, label: {
                    Image("heart")
                        .padding(.top, 42)
                        .padding(.trailing, 22)
                })
                //  }
            }
        }
        .foregroundColor(.white)
    }
}
