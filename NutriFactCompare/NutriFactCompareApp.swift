//
//  NutriFactCompareApp.swift
//  NutriFactCompare
//
//  Created by Rahul Adepu on 7/6/23.
//

import SwiftUI

@main
struct NutriFactCompareApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
