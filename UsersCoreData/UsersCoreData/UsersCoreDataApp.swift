//
//  UsersCoreDataApp.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI

@main
struct UsersCoreDataApp: App {
    //@StateObject var userViewModel = UserViewModel(managedObjectContext: CoreDataStack.shared.container.viewContext)
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                DashboardView()
                    .environment(\.managedObjectContext, CoreDataStack.shared.container.viewContext)
                    .environmentObject(UserViewModel())
            }
            
        }
    }
}
