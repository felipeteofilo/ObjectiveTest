//
//  UnderlineText.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 13/01/24.
//

import SwiftUI

struct UnderlineText: View {
    
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .foregroundColor(Color("fontColor"))
                .opacity(1)
                .font(.custom("Roboto-Black", size: 16))
                .padding(.bottom, 4)
            Divider()
                .frame(height: 2)
                .overlay(Color("iconColor"))
        }
        .fixedSize()
    }
}

#Preview {
    UnderlineText(text: "BUSCA")
}
