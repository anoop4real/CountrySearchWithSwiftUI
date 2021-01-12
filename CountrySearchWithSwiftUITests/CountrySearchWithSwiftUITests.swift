//
//  CountrySearchWithSwiftUITests.swift
//  CountrySearchWithSwiftUITests
//
//  Created by Anoop M on 2021-01-11.
//

import XCTest
@testable import CountrySearchWithSwiftUI

class CountrySearchWithSwiftUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        let mockNwManager = SimpleMockNetworkManager()
        
        let expectation = XCTestExpectation(description: "Simple rest API call")
        let request = APIRouter.byCode("IN")
        mockNwManager.executeWith(request: request) { (result) in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
