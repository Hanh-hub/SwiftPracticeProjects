//
//  CoreDataSwiftUiApp.swift
//  CoreDataSwiftUi
//
//  Created by Hanh Vo on 2/17/23.
//

import SwiftUI

@main
struct CoreDataSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
