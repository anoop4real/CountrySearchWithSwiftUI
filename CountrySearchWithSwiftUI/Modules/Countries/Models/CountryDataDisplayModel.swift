//
//  CountryDataDisplayModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

// Customized model for presentation purpose
struct CountryDataDisplayModel {
    var name: String!
    var nativeName: String!
    var region: String!
    var capital: String!
    var area: String!
    var languages: String!
    var germanTranslation: String!
    var imageURL: URL!
    var latitute: Double!
    var longitude: Double!

    init? (with countryData: CountryData) {
        guard let name = countryData.name, let nativeName = countryData.nativeName, let region = countryData.region, let capital = countryData.capital, let area = countryData.area, let languages = countryData.languages, let germanTranslation = countryData.translations, let imageURL = countryData.flag, let latlong = countryData.latlng else {
            return nil
        }

        self.name = name
        self.nativeName = nativeName
        self.capital = capital
        self.region = region
        self.area = String(area)
        self.languages = languages.compactMap({ $0.name }).joined(separator: ", ")
        self.germanTranslation = germanTranslation.de! + "(de)"
        self.imageURL = URL(string: imageURL)
        self.latitute = latlong[0]
        self.longitude = latlong[1]
    }
}
