//
//  CountrySearchViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

class CountrySearchViewModel: BaseViewModel {
    
    fileprivate var isFilterApplied = false
    fileprivate var filteredArray = [Country]()
    fileprivate var normalArray = [Country]()
    
    override init() {
        super.init()
        self.preparedata()
    }
    
    // Get the list of iso countries from NSLocale
    func preparedata() {
        for countryCode in NSLocale.isoCountryCodes {
            var countryName: String? = NSLocale().displayName(forKey: .countryCode, value: countryCode)
            if countryName == nil {
                countryName = NSLocale(localeIdentifier: "en_US").displayName(forKey: .countryCode, value: countryCode)
            }
            let simpleCountry = Country(countryName: countryName!, countryCode: countryCode.lowercased())
            normalArray.append(simpleCountry)
        }
        normalArray = normalArray.sorted(by: { $0.countryName < $1.countryName })
    }
    
    // Apply the user filter
    func filterBy(keyWord: String) -> [Country] {
        if keyWord.isEmpty {
            return normalArray
        }
        filteredArray = normalArray.filter({ $0.countryName.lowercased().contains(keyWord.lowercased()) })
        return filteredArray
    }    
}
