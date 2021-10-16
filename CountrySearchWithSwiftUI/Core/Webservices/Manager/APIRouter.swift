//
//  APIRouter.swift
//  CountrySearchSwiftUI
//
//  Created by Anoop M on 2021-01-11.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    static let baseURL = "https://restcountries.com/v2"
    
    case byName(String)
    case byCode(String)
    
    var method: HTTPMethod {
        switch self {
        case .byCode, .byName:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .byCode:
            return "/alpha"
        case .byName:
            return "/name"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let param: String = {
            switch self {
            case .byCode(let code):
                return "/\(code)"
            case .byName(let name):
                return "/\(name)"
            }
        }()
        let url = try APIRouter.baseURL.asURL()
        let finalPath = path + param
        var request = URLRequest(url: url.appendingPathComponent(finalPath))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: nil)
    }
}
