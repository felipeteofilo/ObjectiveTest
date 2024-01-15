//
//  HeroModel.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import Foundation

// MARK: - Welcome
struct HeroDataWrapper: Codable {
    let code: Int?
    let status, copyright, attributionText: String?
    let attributionHTML: String?
    let data: HeroDataContainer?
    let etag: String?
}

// MARK: - DataClass
struct HeroDataContainer: Codable {
    let offset, limit, total, count: Int?
    let results: [HeroModel]?
}


struct HeroModel: Identifiable, Codable {
    let id: Int?
    let name, description, modified: String?
    let resourceURI: String?
    let urls: [URLHero]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events, series: Comics?
}

struct Comics: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
}

struct ComicsItem: Codable {
    let resourceURI, name: String?
}

struct Stories: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

struct Thumbnail: Codable {
    let path, thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLHero: Codable {
    let type, url: String?
}
