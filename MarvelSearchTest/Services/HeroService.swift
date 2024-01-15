//
//  HeroService.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func fetchHeroes(page: Int, name: String?) -> AnyPublisher<DataResponse<HeroDataWrapper, NetworkError>, Never>
}

class Service {
    static let shared: ServiceProtocol = Service()
    private init() { }
}

extension Service: ServiceProtocol {
    
    func fetchHeroes(page: Int, name: String?) -> AnyPublisher<DataResponse<HeroDataWrapper, NetworkError>, Never> {
        
        //Base Url from Marvel api
        let MARVEL_BASE_URL = "https://gateway.marvel.com"

        //API Key from Marvel api
        let API_KEY = "&ts=10&apikey=21b4879f76ff271bf8a7267e36be5fec&hash="
        let HASH_API = ("10" + "ea0e83c25dde24b73af13eb80a94033e73fd04f9" + "21b4879f76ff271bf8a7267e36be5fec").MD5
        let pageOffset = "&offset=\(page * 4)"
        var nameFilter = ""
        
        if(name != nil && name != "") {
            nameFilter = "&name=" + name!
        }
        
        let urlCharacters = MARVEL_BASE_URL + "/v1/public/characters?limit=4" + nameFilter + pageOffset + API_KEY + HASH_API
        
        let url = URL(string: urlCharacters)!
        
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: HeroDataWrapper.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
