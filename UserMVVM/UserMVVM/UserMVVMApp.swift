//
//  UserMVVMApp.swift
//  UserMVVM
//
//  Created by Hanh Vo on 2/27/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct UserMVVMApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView().environment(\.managedObjectContext, DataController.shared.container.viewContext)
            }
            
        }
    }
}
