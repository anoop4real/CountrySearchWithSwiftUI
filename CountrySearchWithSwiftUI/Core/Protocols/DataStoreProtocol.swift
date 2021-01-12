//
//  DataStoreProtocol.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-12.
//

import Foundation

protocol DataStoreProtocol {
    associatedtype T
    func sectionCount() -> Int
    func rowsCountIn(section: Int) -> Int
    func itemAt(row: Int) -> T?
}
