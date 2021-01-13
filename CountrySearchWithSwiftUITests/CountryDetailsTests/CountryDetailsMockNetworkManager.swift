//
//  CountryDetailsMockNetworkManager.swift
//  CountrySearchWithSwiftUITests
//
//  Created by Anoop M on 2021-01-13.
//

import Foundation
import Alamofire
@testable import CountrySearchWithSwiftUI

class CountryDetailsMockNetworkManager: NetworkManagerProtocol {
    func executeWith(request: URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        let json = mockCountryDetailResponse()
        if let data = json.data(using: .utf8) {
            completion(.success(data))
        } else {
            completion(.failure(generalError()))
        }
        
    }
    
}
