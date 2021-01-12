//
//  BaseViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation
import Alamofire

class BaseViewModel {
    
    /// Generic function process the response
    func process< T: Codable>(response: Result<Data, Error>, type: T.Type) -> Result<T,ApplicationError.APIErrors> {
        
        switch response {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                let responseDataModel = try decoder.decode(type, from: data)
                return .success(responseDataModel)
            } catch (let error) {
                return .failure(handleErrors(error: error))
            }
        case .failure(let error):
            return .failure(handleErrors(error: error))
        }
    }
    
    func handleErrors(error: Error)-> ApplicationError.APIErrors {
        // TODO: Handle
        if let err = error as? AFError {
            
        } else if let err = error as NSError? {
            
        } else {
            return .unknown
        }
        return .unknown
    }
}
