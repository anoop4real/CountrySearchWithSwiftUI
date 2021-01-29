//
//  CountrySearchWithSwiftUIApp.swift
//  CountrySearchWithSwiftUI
//
//  Created by Anoop M on 2021-01-11.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder
@main
struct CountrySearchWithSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        setUpDependencies()
    }
    var body: some Scene {
        WindowGroup {
            CountryListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

private extension CountrySearchWithSwiftUIApp {
    
    func setUpDependencies() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
