//
//  MarvelHeroDetailsViewModelTests.swift
//  MarvelSearchTestTests
//
//  Created by Leticia Sobral on 13/01/24.
//

import XCTest
@testable import MarvelSearchTest

final class MarvelHeroDetailsViewModelTests: XCTestCase {
    
    var viewModel: MarvelHeroDetailsViewModel!

    override func setUpWithError() throws {
        
        viewModel = MarvelHeroDetailsViewModel(hero: HeroModel(id: 0, name: "Tony Stark", description: "", modified: "", resourceURI: "", urls: nil, thumbnail: nil, comics: nil, stories: nil, events: nil, series: nil))
    }

    override func tearDownWithError() throws {
        
        viewModel = nil
    }
    
    func testGetSiteByType() throws {
        let comicUrl = "comic.com"
        let heroUrl = "wiki.com"
        let urls = [URLHero(type: "comiclink", url: comicUrl), URLHero(type: "wiki", url: heroUrl)]
        
        viewModel = MarvelHeroDetailsViewModel(hero: HeroModel(id: 0, name: "Tony Stark", description: "", modified: "", resourceURI: "", urls: urls, thumbnail: nil, comics: nil, stories: nil, events: nil, series: nil))
        
        //test get hero site
       let urlTestHero = viewModel.getHeroSite()
        
        XCTAssertEqual(urlTestHero.absoluteString, heroUrl, "url hero error")
        
        //test get comic site
       let urlTestComic =  viewModel.getHeroComicsSite()
        
        XCTAssertEqual(urlTestComic.absoluteString, comicUrl, "url comic error")
        
    }
}

