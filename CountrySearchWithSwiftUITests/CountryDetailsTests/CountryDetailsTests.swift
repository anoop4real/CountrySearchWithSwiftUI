//
//  CountryDetailsTests.swift
//  CountrySearchWithSwiftUITests
//
//  Created by Anoop M on 2021-01-13.
//

@testable import CountrySearchWithSwiftUI
import XCTest

class CountryDetailsTests: XCTestCase {
    var viewModel: CountryDetailsViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CountryDetailsViewModel(with: CountryDetailsMockNetworkManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testGetCountryDetailsSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.fetchDetailsOfCountryWith(code: "IN")

        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            switch self.viewModel.countryDetailsResponse {
            case .success(let countryData):
                XCTAssertEqual(countryData.name, "India")
            case .failure(let error):
                XCTAssertNotNil(error)
            case .none:
                break
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testGetCountryDetailsFail() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.fetchDetailsOfCountryWith(code: "IN")

        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            switch self.viewModel.countryDetailsResponse {
            case .success(let countryData):
                XCTAssertNotEqual(countryData.name, "Germany")
            case .failure(let error):
                XCTAssertNotNil(error)
            case .none:
                break
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
