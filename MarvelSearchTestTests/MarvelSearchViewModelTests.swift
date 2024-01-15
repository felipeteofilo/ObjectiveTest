//
//  MarvelSearchViewModelTests.swift
//  MarvelSearchTestTests
//
//  Created by Leticia Sobral on 15/01/24.
//

import XCTest
@testable import MarvelSearchTest

final class MarvelSearchViewModelTests: XCTestCase {
    
    var viewModel: MarvelSearchViewModel!

    override func setUpWithError() throws {
        
        viewModel = MarvelSearchViewModel()
    }

    override func tearDownWithError() throws {
        
        viewModel = nil
    }
    
    func testGetNumberPagesByTotal() throws {
        
        let total = 160
        let expectedNumber = 40
        
        //test empty name filter
        viewModel.getNumberPagesByTotal(total: total)
        
        XCTAssertEqual(viewModel.numberPages, expectedNumber, "get number pages error")
        
    }
    
    func testCreateAlert() throws {
        
        //test backend error
        viewModel.createAlert(with: NetworkError(initialError: .invalidURL(url: URL(string: "test.com")!), backendError: BackendError(status: "404", message: "Error")))
        
        XCTAssertTrue(viewModel.showAlert, "alert show ok")
        XCTAssertEqual(viewModel.heroListLoadingError, "Error", "alert show ok")
        
        //test initial error
        viewModel.createAlert(with: NetworkError(initialError: .invalidURL(url: URL(string: "test.com")!), backendError: nil))
        
        XCTAssertTrue(viewModel.showAlert, "alert show ok")
        XCTAssertEqual(viewModel.heroListLoadingError, "URL is not valid: test.com", "alert show ok")
        
    }

}
