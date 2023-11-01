//
//  CoreDataBookWormApp.swift
//  CoreDataBookWorm
//
//  Created by Hanh Vo on 2/17/23.
//

import SwiftUI

@main
struct CoreDataBookWormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
