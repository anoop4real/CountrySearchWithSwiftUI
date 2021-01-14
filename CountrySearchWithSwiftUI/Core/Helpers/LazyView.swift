//
//  LazyView.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-14.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
