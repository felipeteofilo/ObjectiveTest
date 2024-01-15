//
//  HeroCell.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import SwiftUI

struct HeroCell: View {
    
    var hero: HeroModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
                .frame(height: 18)
            
            HStack(alignment: .center) {
                
                Spacer()
                    .frame(width: 18)
                
                let urlThumb = hero.thumbnail?.path?.appending("." + (hero.thumbnail?.thumbnailExtension ?? "")) ?? ""
                
                AsyncImage(url: URL(string: urlThumb)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    Image("heroPlaceholder")
                        .resizable()
                        .renderingMode(.template)
                        .clipShape(Circle())
                        .foregroundColor(Color("iconColor"))
                }
                .frame(width:80, height:80)
                
                Spacer()
                    .frame(width: 18)
                
                Text(hero.name ?? "")
                    .foregroundColor(Color("heroFontColor"))
                    .opacity(1)
                    .font(.custom("Roboto-Regular", size: 24))
            }
            
            Spacer()
                .frame(height: 18)
            
            Divider()
                .frame(height: 2)
                .overlay(Color("iconColor"))
        }
    }
}

#Preview {
    HeroCell(hero: HeroModel(id: 0, name: "Tony Stark", description: "", modified: "", resourceURI: "", urls: nil, thumbnail: nil, comics: nil, stories: nil, events: nil, series: nil))
}
