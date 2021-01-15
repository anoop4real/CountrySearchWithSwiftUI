//
//  CountryDetailsView.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import SwiftUI

struct CountryDetailsView: View {
    
    private var selectedCountry: Country
    @ObservedObject var countryDetailsViewModel = CountryDetailsViewModel(with: NetworkDataManager())
    
    init(selectedCountry: Country) {
        self.selectedCountry = selectedCountry
        countryDetailsViewModel.fetchDetailsOfCountryWith(code: self.selectedCountry.countryCode)
    }
    var body: some View {
            VStack {
                if self.countryDetailsViewModel.viewState == .busy {
                    ProgressView()
                } else {
                    switch self.countryDetailsViewModel.countryDetailsResponse {
                    case .success(let countryData):
                        MapView(coordinateRegion: countryData.getRegionCoordinate())
                        List {
                            ForEach(countryData.listData.sorted(by: >), id: \.key) { key, value in
                                CountryDetailsRow(key: key, value: value)
                            }
                        }
                        .listStyle(PlainListStyle())
                    case .failure(let error):
                        Text("Error fetching data")
                    case .none:
                        Text("Error fetching data")
                    }
                }
            }
            .navigationTitle(selectedCountry.countryName)
        }        
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(selectedCountry: Country(countryName: "India", countryCode: "IN"))
    }
}
