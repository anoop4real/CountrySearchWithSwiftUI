//
//  CountrySearchWithSwiftUIApp.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-11.
//

import SwiftUI

@main
struct CountrySearchWithSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
