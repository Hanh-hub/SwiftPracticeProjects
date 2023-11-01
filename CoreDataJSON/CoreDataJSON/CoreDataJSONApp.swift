//
//  CoreDataJSONApp.swift
//  CoreDataJSON
//
//  Created by Hanh Vo on 2/16/23.
//

import SwiftUI

@main
struct CoreDataJSONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
