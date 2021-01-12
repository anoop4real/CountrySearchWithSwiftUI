//
//  Errors.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

enum ApplicationError: Error {
    // Errors coming from the API Calls
    enum APIErrors: Error, CustomStringConvertible {
        case unknown
        var description: String {
            switch self {
            case .unknown:
                return "Unknown"
            }
        }
    }
}
