//
//  HeroServiceTest.swift
//  MarvelSearchTestTests
//
//  Created by Leticia Sobral on 15/01/24.
//

import XCTest
import Combine
@testable import MarvelSearchTest

final class HeroServiceTest: XCTestCase {

    var dataManager: ServiceProtocol!
    var cancellableSet: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        
        dataManager = Service.shared
    }

    override func tearDownWithError() throws {
        
        dataManager = nil
    }
    
    func testFetchHeroes() throws {
        
        //TODO: make a MOCK to test
        let readyExpectation = expectation(description: "ready")
        
        //test fetch 4 initial heroes Sucess
        dataManager.fetchHeroes(page: 0, name: "").sink { (dataResponse) in
            if dataResponse.error != nil {
                
                XCTAssertThrowsError("request failed,error happen")
                readyExpectation.fulfill()
            } else {
                
                XCTAssertNotNil(dataResponse.value?.data?.results, "request failed,error happen")
                
                XCTAssertGreaterThan(dataResponse.value!.data!.results!.count, 0 , "request failed,error happen")
                
                XCTAssertGreaterThan( dataResponse.value!.data!.total!, 0 , "request failed,error happen")
                
                readyExpectation.fulfill()
            }
        }.store(in: &cancellableSet)
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
        
    }
    
    func testFetchHeroesByName() throws {
        
        //TODO: make a MOCK to test
        let hero = "Abyss"
        let readyExpectation = expectation(description: "ready")
        
        //test fetch Abyss hero Sucess
        dataManager.fetchHeroes(page: 0, name: hero).sink { (dataResponse) in
            if dataResponse.error != nil {
                
                XCTAssertThrowsError("request failed,error happen")
                readyExpectation.fulfill()
            } else {
                
                XCTAssertNotNil(dataResponse.value?.data?.results, "request failed,error happen")
                
                XCTAssertGreaterThan(dataResponse.value!.data!.results!.count, 0 , "request failed,error happen")
                
                XCTAssertGreaterThan( dataResponse.value!.data!.total!, 0 , "request failed,error happen")
                
                XCTAssertEqual(dataResponse.value!.data!.results![0].name, hero, "request failed,error happen")
                
                readyExpectation.fulfill()
            }
        }.store(in: &cancellableSet)
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }

}
