//
//  CountrySearchWithSwiftUITests.swift
//  CountrySearchWithSwiftUITests
//
//  Created by Anoop M on 2021-01-11.
//

@testable import CountrySearchWithSwiftUI
import XCTest

class CountrySearchWithSwiftUITests: XCTestCase {
    var viewModel: CountrySearchViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CountrySearchViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testSearchCountSuccess() throws {
        let results = viewModel.filterBy(keyWord: "IND")
        XCTAssertFalse(results.isEmpty)
        XCTAssertTrue(results.count == 3)
    }

    func testSearchSuccess() throws {
        let results = viewModel.filterBy(keyWord: "Germany")
        let country = results.first
        XCTAssertFalse(results.isEmpty)
        XCTAssertTrue(country?.countryName == "Germany")
    }

    func testSearchNotFoundSuccess() throws {
        let results = viewModel.filterBy(keyWord: "Unknown")
        XCTAssertTrue(results.isEmpty)
    }
}
