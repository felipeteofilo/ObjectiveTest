//
//  HeroSection.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import SwiftUI

struct HeroSection: View {
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            Spacer()
                .frame(width: 116)
            
            Text("Nome")
                .foregroundColor(.white)
                .opacity(1)
                .font(.custom("Roboto-Regular", size: 18))
                .padding([.top,.bottom, .trailing])
            Spacer()
        }
        .background(Color("iconColor"))
    }
}

#Preview {
    HeroSection()
}
