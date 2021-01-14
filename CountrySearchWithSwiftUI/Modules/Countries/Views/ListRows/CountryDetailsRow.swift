//
//  CountryDetailsRow.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-14.
//

import SwiftUI

struct CountryDetailsRow: View {
    var key: String
    var value: String
    var body: some View {
        HStack {
            Text(key)
            Spacer()
            Text(value).frame(alignment: .trailing)
        }
    }
}

struct CountryDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsRow(key: "Name", value: "India")
    }
}
