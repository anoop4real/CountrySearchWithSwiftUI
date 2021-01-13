//
//  CountryDetailsViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

class CountryDetailsViewModel: BaseViewModel, ObservableObject {
    private var networkManager: NetworkManagerProtocol!

    @Published var countryDetailsResponse: Result<CountryDataDisplayModel, ApplicationError.APIErrors>!
    init(with networkManager: NetworkManagerProtocol = NetworkDataManager()) {
        super.init()
        self.networkManager = networkManager
    }

    func fetchDetailsOfCountryWith(code: String) {
        networkManager.executeWith(request: APIRouter.byCode(code)) { [weak self] result in
            guard let processedResult = self?.process(response: result, type: CountryData.self) else {
                self?.countryDetailsResponse = .failure(ApplicationError.APIErrors.unknown)
                return
            }
            switch processedResult {
            case .success(let countryData):
                if let displayModel = self?.createViewModelFrom(countryData: countryData) {
                    self?.countryDetailsResponse = .success(displayModel)
                } else {
                    // TODO: Check errors
                    self?.countryDetailsResponse = .failure(ApplicationError.APIErrors.unknown)
                }
            case .failure(let error):
                self?.countryDetailsResponse = .failure(error)
            }
        }
    }

    // From the JSON model, prepate the data model for display.
    private func createViewModelFrom(countryData: CountryData) -> CountryDataDisplayModel? {
        let displayData = CountryDataDisplayModel(with: countryData)
        return displayData
    }
}
