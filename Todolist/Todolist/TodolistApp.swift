//
//  TodolistApp.swift
//  Todolist
//
//  Created by Hanh Vo on 1/23/23.
//

import SwiftUI

@main
struct TodolistApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
            
        }
    }
}
