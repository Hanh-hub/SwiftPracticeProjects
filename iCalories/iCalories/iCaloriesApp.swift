//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Hanh Vo on 2/16/23.
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
struct iCaloriesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dataController = DataController()
    
    var body: some Scene {
      
        WindowGroup {
            NavigationView{
                ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
            }
            
        }
    }
}
