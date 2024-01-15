//
//  ListIndicator.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 13/01/24.
//

import SwiftUI

struct ArrowImage: View {
    
    @State private(set) var isLeft: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(isLeft ? "leftArrow" : "rightArrow")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("iconColor"))
                .frame(width: 24, height: 32)
        }
    }
}

struct HScrollView<Content>: View where Content: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                content
                    .frame(minWidth: geometry.size.width)
            }
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
        }
    }
}

struct ListIndicator: View {
    
    @Binding var indicatorSelected: Int
    var itens: Int
    
    var body: some View {
        
        VStack(alignment: .center) {
            ScrollViewReader { scrollControls in
                HStack(alignment: .center) {
                    
                    ArrowImage(isLeft: true)
                        .onTapGesture {
                            if(indicatorSelected > 0) {
                                indicatorSelected -= 1
                                scrollControls.scrollTo(indicatorSelected, anchor: .center)
                            }
                        }
                    
                    Spacer()
                        .frame(width: 60)
                    
                    HScrollView {
                        LazyHStack (alignment: .center, spacing: 0) {
                            ForEach(0..<itens, id: \.self) { index in
                                
                                VStack(alignment: .center, spacing: 0) {
                                    Text(String(String(index + 1)))
                                        .foregroundColor(indicatorSelected == index ? .white : Color("iconColor"))
                                        .opacity(1)
                                        .font(.custom("Roboto-Light", size: 28))
                                }
                                .frame(width: 42, height: 42)
                                .background(indicatorSelected == index ? Color("iconColor") : .white)
                                .overlay {
                                    indicatorSelected == index ? nil : Circle().stroke(Color("iconColor"), lineWidth: 2)
                                }
                                .clipShape(Circle())
                                .padding(.leading, index == 0 ? 0 : 10)
                                .onTapGesture {
                                    self.indicatorSelected = index
                                    scrollControls.scrollTo(indicatorSelected, anchor: .center )
                                }
                            }
                        }
                    }
                    .frame(height: 42)
                    
                    Spacer()
                        .frame(width: 60)
                    
                    ArrowImage(isLeft: false)
                        .onTapGesture {
                            if(indicatorSelected < itens - 1) {
                                indicatorSelected += 1
                                scrollControls.scrollTo(indicatorSelected, anchor: .center )
                            }
                        }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding([.leading, .trailing], 30)
    }
}

#Preview {
    ListIndicator(indicatorSelected: .constant(0), itens: 5)
}
