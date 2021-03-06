//
//  CountryListView.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import Combine
import SwiftUI
import SDWebImageSwiftUI

struct CountryListView: View {
    @State private var searchText: String = ""
    private var countrySearchViewModel = CountrySearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                #if os(iOS)
                SearchBar(searchText: $searchText)
                #endif
                List(countrySearchViewModel.filterBy(keyWord: searchText)) { country in
                    NavigationLink(destination: LazyView(CountryDetailsView(selectedCountry: country))) {
                        CountryListRow(country: country)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle(Text("Countries"))
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
