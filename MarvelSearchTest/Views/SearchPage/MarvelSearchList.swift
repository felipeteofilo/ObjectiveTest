//
//  ContentView.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 13/01/24.
//

import SwiftUI

struct MarvelSearchList: View {
    
    @ObservedObject var viewModel = MarvelSearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                        .frame(height: 12)
                    HStack(alignment: .top, spacing: 0) {
                        UnderlineText(text: "BUSCA")
                        HStack(alignment: .top, spacing: 0) {
                            Text(" MARVEL")
                                .foregroundColor(Color("fontColor"))
                                .opacity(1)
                                .font(.custom("Roboto-Black", size: 16))
                            Text("TESTE FRONT-END")
                                .foregroundColor(Color("fontColor"))
                                .opacity(1)
                                .font(.custom("Roboto-Light", size: 16))
                        }
                    }
                    
                    Spacer()
                        .frame(height: 12)
                    
                    SearchView(searchText: $viewModel.nameFilter)
                        .onSubmit {
                            viewModel.getHeroListByName()
                        }
                        .onChange(of: viewModel.nameFilter) { oldValue, newValue in
                            viewModel.getHeroListByName()
                        }
                }
                .padding([.leading, .trailing], 30)
                
                Spacer()
                    .frame(height: 12)
                
                HeroSection()
                
                List {
                    ForEach(viewModel.heroes , id: \.id) { hero in
                        HeroCell(hero: hero)
                            .background(
                                NavigationLink("", destination: MarvelHeroDetails(viewModel: MarvelHeroDetailsViewModel(hero: hero)))
                                    .opacity(0)
                            )
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .scrollBounceBehavior(.always)
                .listStyle(.plain)
                .refreshable {
                    viewModel.getHeroList()
                }
                
                Spacer()
                    .frame(height: 18)
                
                ListIndicator(indicatorSelected: $viewModel.pageSelected, itens: viewModel.numberPages)
                    .onChange(of: viewModel.pageSelected) { oldValue, newValue in
                        viewModel.getHeroList()
                    }
                
                Spacer()
                    .frame(height: 24)
                
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(Color("iconColor"))
            }
            .background(.white)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text (viewModel.heroListLoadingError ), dismissButton: .default(Text("OK")))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MarvelSearchList()
}
