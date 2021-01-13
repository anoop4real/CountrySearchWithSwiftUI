//
//  Country.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation
// Simple model to display the list
struct Country: Identifiable {
    var id: String {
        return countryCode
    }
    
    var countryName: String
    var countryCode: String
}
