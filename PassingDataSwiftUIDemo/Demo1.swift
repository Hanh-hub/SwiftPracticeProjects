//
//  Demo1.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/3/23.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var fontSize: Double = 17.0
}

struct ContentViewA1: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("Hello, World!!!!")
            .font(.system(size: CGFloat(settings.fontSize)))
    }
}

struct SettingsView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack {
            Text("Font Size: \(Int(settings.fontSize))")
            Slider(value: $settings.fontSize, in: (10.0...30.0))
        }
    }
}

struct AppViewA1: View {
    @ObservedObject var settings = UserSettings()
    
    var body: some View {
        TabView {
            ContentViewA1().environmentObject(settings)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Content")
                }
            
            SettingsView().environmentObject(settings)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}


struct AppViewA1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AppViewA1().environmentObject(UserSettings())
    }
}
