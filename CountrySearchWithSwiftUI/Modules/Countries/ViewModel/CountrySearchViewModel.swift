//
//  CountrySearchViewModel.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

class CountrySearchViewModel: BaseViewModel, ObservableObject {
    
    fileprivate var isFilterApplied = false
    @Published fileprivate var filteredArray = [Country]()
    @Published fileprivate var normalArray = [Country]()
    
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
    func filterBy(keyWord: String) {
        if keyWord.isEmpty {
            setFilterWith(status: false)
            return
        }
        filteredArray = normalArray.filter({ $0.countryName.lowercased().contains(keyWord.lowercased()) })
        setFilterWith(status: true)
    }

    // If user is searching then set the filter flag
    func setFilterWith(status: Bool) {
        isFilterApplied = status
    }
    
}

extension CountrySearchViewModel: DataStoreProtocol {
    func sectionCount() -> Int {
        return 1
    }

    func rowsCountIn(section: Int) -> Int {
        var rowCount = 0

        if isFilterApplied {
            rowCount = filteredArray.count
        } else {
            rowCount = normalArray.count
        }
        return rowCount
    }

    func itemAt(row: Int) -> Country? {
        if isFilterApplied {
            return filteredArray[row]
        } else {
            return normalArray[row]
        }
    }
}
