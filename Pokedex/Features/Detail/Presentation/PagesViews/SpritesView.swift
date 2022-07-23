//
//  SpritesView.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 14/07/22.
//

import SwiftUI

struct SpritesView: View {
    @State var listSprite: Sprites
    
    var body: some View {
        VStack(alignment: .leading, spacing:  0) {
                Text("Sprites")
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .padding(.leading, 16)
                    .padding(.top, 6)
                    .foregroundColor(.white)

            // -------------------------------------- APLICAR MACHINE LEARNING
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // alterar para switch
                    if listSprite.back_default != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.back_default ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                    if listSprite.back_shiny != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.back_shiny ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                    if listSprite.back_female != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.back_female ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                                    
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                    if listSprite.back_shiny_female != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.back_shiny_female ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                    if listSprite.front_default != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.front_default ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                                    
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                    if listSprite.front_female != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.front_female ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                                  
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    if listSprite.front_shiny != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.front_shiny ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                                    
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    if listSprite.front_shiny_female != nil {
                        AsyncImage( // arrumar quando carrega a imagem ou n acha
                            url: URL(string: listSprite.front_shiny_female ?? ""),
                            content: { image in
                                image.resizable()
                                    .frame(width: 144, height: 144)
                                    
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 16)
            }
        }
    }
}

struct SpritesView_Previews: PreviewProvider {
    static var previews: some View {
        SpritesView(listSprite: Sprites())
    }
}
