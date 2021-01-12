//
//  CountryDetailsViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

class CountryDetailsViewModel: BaseViewModel, ObservableObject {
    
    private var networkManager: NetworkManagerProtocol!
    
    init(with networkManager: NetworkManagerProtocol = NetworkDataManager()) {
        super.init()
        self.networkManager = networkManager
    }
    
    // TODO: Add network function call
    
    // From the JSON model, prepate the data model for display.
    func createViewModelFrom(countryData: CountryData) -> CountryDataDisplayModel? {
        let displayData = CountryDataDisplayModel(with: countryData)
        return displayData
    }
}
