//
//  CoreDataBudgetApp.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/19/23.
//

import SwiftUI

@main
struct CoreDataBudgetApp: App {
    let viewContext = CoreDataStack.shared.managedObjContext
   
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(context: viewContext)).environment(\.managedObjectContext,viewContext )
        }
    }
}

