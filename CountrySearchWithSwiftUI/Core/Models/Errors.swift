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
        case generalError(reason: String)
        case forbidden
        case notConnectedToInternet
        case notFound
        case authenticationFailed
        // TODO: Localize
        var description: String {
            switch self {
            case .unknown:
                return "Unknown"
            case .generalError(reason: let reason):
                return reason
            case .forbidden:
                return "Forbidden to Access"
            case .notConnectedToInternet:
                return "Not connected to Internet"
            case .notFound:
                return "Resource Not Found"
            case .authenticationFailed:
                return "Authentication Failed"
            }
        }
    }
}
