//
//  SimpleMockNetworkManager.swift
//  CountrySearchSwiftUI
//
//  Created by Anoop M on 2021-01-11.
//

import Foundation
import Alamofire
@testable import CountrySearchWithSwiftUI

class SimpleMockNetworkManager: NetworkManagerProtocol {
    func executeWith(request: URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(request)
            .validate()
            .responseJSON { (response) in
                
                if let error = response.error {
                    completion(.failure(error))
                } else {
                    guard let json = response.data else {
                        let err = NSError(domain: "Unknown", code: 0, userInfo: nil)
                        completion(.failure(err))
                        return
                    }
                    print(json)
                    completion(.success(json))
                }
            }
    }
}
