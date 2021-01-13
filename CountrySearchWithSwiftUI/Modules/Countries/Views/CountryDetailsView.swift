//
//  CountryDetailsView.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import SwiftUI

struct CountryDetailsView: View {
    
    var selectedCountry: Country
    @ObservedObject var countryDetailsViewModel = CountryDetailsViewModel(with: NetworkDataManager())
    
    init(selectedCountry: Country) {
        self.selectedCountry = selectedCountry
        countryDetailsViewModel.fetchDetailsOfCountryWith(code: self.selectedCountry.countryCode)
    }
    var body: some View {
        VStack {
            switch self.countryDetailsViewModel.countryDetailsResponse {
            case .success(let countryData):
                Text(countryData.name)
            case .failure(let error):
                Text("Error fetching data")
            case .none:
                Text("Error fetching data")
            }
        }

    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(selectedCountry: Country(countryName: "India", countryCode: "IN"))
    }
}
