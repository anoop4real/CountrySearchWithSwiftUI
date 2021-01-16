//
//  BaseViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Alamofire
import Foundation

class BaseViewModel: ObservableObject {
    @Published var viewState: ViewState = .idle
    /// Generic function process the response
    func process<T: Codable>(response: Result<Data, Error>, type: T.Type) -> Result<T, ApplicationError.APIErrors> {
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

    func handleErrors(error: Error) -> ApplicationError.APIErrors {
        // TODO: Localize
        if let err = error as? AFError {
            switch err {
            case .createUploadableFailed(error: let error):
                return .generalError(reason: error.localizedDescription)
            case .createURLRequestFailed(error: let error):
                return .generalError(reason: error.localizedDescription)
            case .explicitlyCancelled:
                return .generalError(reason: "Request cancelled by user")
            case .invalidURL(url: let url):
                print(url)
                return .generalError(reason: "Invalid URL")
            case .requestAdaptationFailed(error: let error):
                return .generalError(reason: error.localizedDescription)
            case .requestRetryFailed(retryError: let retryError, originalError: let originalError):
                print(originalError.localizedDescription)
                return .generalError(reason: retryError.localizedDescription)
            case .responseValidationFailed(reason: let reason):
                print("Failure Reason: \(reason)")

                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    print("Downloaded file could not be read")
                case .missingContentType(let acceptableContentTypes):
                    print("Content Type Missing: \(acceptableContentTypes)")
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                case .unacceptableStatusCode(let code):
                    print("Response status code was unacceptable: \(code)")
                default: print("Default")
                }
            case .responseSerializationFailed(reason: let reason):
                print("Response serialization failed: \(err.localizedDescription)")
                print("Failure Reason: \(reason)")
            case .sessionDeinitialized:
                return .generalError(reason: "Session Deinitialized")
            case .sessionInvalidated(error: let error):
                return .generalError(reason: "Session Invalidated \(String(describing: error?.localizedDescription))")
            default:
                break
            }
        } else if let err = error as NSError? {
            switch err.code {
            case 401:
                return ApplicationError.APIErrors.authenticationFailed
            case 403:
                return ApplicationError.APIErrors.forbidden
            case 404:
                return ApplicationError.APIErrors.notFound
            default:
                return ApplicationError.APIErrors.unknown
            }

        } else {
            return .unknown
        }
        return .unknown
    }

    func updateState(state: ViewState) {
        viewState = state
    }
}
