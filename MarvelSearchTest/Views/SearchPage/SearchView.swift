//
//  SearchView.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 13/01/24.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome do Personagem")
                .foregroundColor(Color("fontColor"))
                .opacity(1)
                .font(.custom("Roboto-Regular", size: 14))
            
            TextField("", text: $searchText)
                .foregroundColor(Color("fontColor"))
                .font(.custom("Roboto-Regular", size: 14))
                .padding(8)
                .submitLabel(.search)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("SearchStrokeColor"), lineWidth: 1))
        }
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
