//
//  SearchBar.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-13.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchText: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchText: String
        
        init(value: Binding<String>) {
            _searchText = value
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.searchText = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(value: $searchText)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
}
