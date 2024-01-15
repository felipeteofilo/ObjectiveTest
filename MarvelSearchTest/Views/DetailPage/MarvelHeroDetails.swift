//
//  MarvelHeroDetails.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 15/01/24.
//

import SwiftUI

struct MarvelHeroDetails: View {
    
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel: MarvelHeroDetailsViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                let urlThumb = viewModel.hero.thumbnail?.path?.appending("." + (viewModel.hero.thumbnail?.thumbnailExtension ?? "")) ?? ""
                
                AsyncImage(url: URL(string: urlThumb)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    Image("heroPlaceholder")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("iconColor"))
                }
                .frame(height:330)
                
                Text(viewModel.hero.name ?? "")
                    .foregroundColor(.white)
                    .opacity(1)
                    .font(.custom("Roboto-Black", size: 32))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.6))
            }
            
            Spacer()
                .frame(height: 18)
            
            ScrollView {
                Text(viewModel.hero.description ?? "")
                    .foregroundColor(Color("fontColor"))
                    .opacity(1)
                    .font(.custom("Roboto-Black", size: 16))
                    .frame(maxHeight: .infinity)
                    .padding()
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack (alignment: .center) {
                
                let comics = "\(viewModel.hero.comics?.available ?? 0) comics"
                Text(comics)
                    .foregroundColor(.white)
                    .opacity(1)
                    .font(.custom("Roboto-Black", size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("iconColor"))
                    .padding()
                
                let stories = "\(viewModel.hero.stories?.available ?? 0) stories"
                Text(stories)
                    .foregroundColor(.white)
                    .opacity(1)
                    .font(.custom("Roboto-Black", size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("iconColor"))
                    .padding()
                
                let series = "\(viewModel.hero.series?.available ?? 0) series"
                Text(series)
                    .foregroundColor(.white)
                    .opacity(1)
                    .font(.custom("Roboto-Black", size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("iconColor"))
                    .padding()
            }
            .frame(height: 100)
            
            Spacer()
                .frame(height: 20)
            
            VStack() {
                Button(action: {
                    openURL(viewModel.getHeroSite())
                }) {
                    HStack {
                        Text("View Full Profile on Marvel")
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(Color("iconColor"))
                
                Spacer()
                    .frame(height: 12)
                
                Button(action: {
                    openURL(viewModel.getHeroComicsSite())
                }) {
                    HStack {
                        Text("View all comics on Marvel")
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color("iconColor"))
            }
            .padding([.leading,.trailing])
        }
    }
}

#Preview {
    MarvelHeroDetails(viewModel:MarvelHeroDetailsViewModel(hero: HeroModel(id: 0, name: "Tony Stark", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at facilisis augue. Nam a rhoncus nunc. Sed molestie enim felis, ac ultrices turpis tristique id.", modified: "", resourceURI: "", urls: nil, thumbnail: nil, comics: Comics(available: 1677, returned: 0, collectionURI: "", items: nil), stories: nil, events: nil, series: nil)))
}
