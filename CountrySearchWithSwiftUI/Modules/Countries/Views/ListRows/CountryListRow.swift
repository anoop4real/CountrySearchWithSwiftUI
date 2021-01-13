//
//  CountryListRow.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import Foundation
import SwiftUI

struct CountryListRow: View {
    var country: Country

    var body: some View {
        HStack {
            Text(country.countryName).frame(alignment: .leading)
        }
    }
}

struct CountryListRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryListRow(country: Country(countryName: "India", countryCode: "IN"))
    }
}
