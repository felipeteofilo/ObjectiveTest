//
//  MarvelHeroDetailsViewModel.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 15/01/24.
//

import Foundation
import Combine

class MarvelHeroDetailsViewModel: ObservableObject {

    @Published var hero: HeroModel
    
    init(hero: HeroModel) {
        self.hero = hero
    }
    
    func getHeroComicsSite() -> URL {
        return getSiteByType(type: "comiclink")
    }
    
    func getHeroSite() -> URL {
        return getSiteByType(type: "wiki")
    }
    
    private func getSiteByType(type: String) -> URL {
        if(hero.urls?.count ?? 0 > 0) {
            for urlHero in hero.urls! {
                if (urlHero.type == type) {
                    return URL(string: urlHero.url ?? "https://www.marvel.com")!
                }
            }
        }
        return URL(string: "https://www.marvel.com")!
    }
}
