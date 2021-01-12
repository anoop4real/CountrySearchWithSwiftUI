//
//  NetworkManagerProtocol.swift
//  CountrySearchSwiftUI
//
//  Created by Anoop M on 2021-01-11.
//

import Foundation
import Alamofire

/// Protocol to be followed by all netowork managers
protocol NetworkManagerProtocol {
    func executeWith(request: URLRequestConvertible, completion:@escaping (Result<Data, Error>) -> Void)
}
