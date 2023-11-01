//
//  UsersCoreDataApp.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI

@main
struct UsersCoreDataApp: App {
    @StateObject var coreDataStack = CoreDataStack()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                DashboardView().environment(\.managedObjectContext, coreDataStack.container.viewContext)
            }
            
        }
    }
}
