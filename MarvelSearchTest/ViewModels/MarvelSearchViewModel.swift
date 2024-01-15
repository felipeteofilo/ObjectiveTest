//
//  MarvelSearchViewModel.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import Foundation
import Combine

class MarvelSearchViewModel: ObservableObject {
    
    @Published var heroes =  [HeroModel]()
    @Published var numberPages = 0
    @Published var pageSelected = 0
    @Published var nameFilter = ""
    @Published var heroListLoadingError: String = ""
    @Published var showAlert: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init( dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
        getHeroList()
    }
    
    func getHeroListByName() {
        if(nameFilter != "") {
            pageSelected = 0
        }
        getHeroList()
    }
    
    func getHeroList() {
        dataManager.fetchHeroes(page: pageSelected, name: nameFilter)
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.heroes = dataResponse.value?.data?.results ?? []
                    self.getNumberPagesByTotal(total:dataResponse.value?.data?.total ?? 0)
                }
            }.store(in: &cancellableSet)
    }
    
    func getNumberPagesByTotal(total: Int) {
        //always get a number round up
        self.numberPages = (total + 3) / 4
    }
    
    func createAlert( with error: NetworkError ) {
        heroListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
