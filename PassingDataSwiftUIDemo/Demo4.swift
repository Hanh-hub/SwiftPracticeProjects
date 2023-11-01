//
//  Demo4.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/8/23.
//

import SwiftUI

struct Demo4: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Demo4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}



class User4: ObservableObject {
    @Published var name: String = "John Doe"
}

struct CreateUserView: View {
    @StateObject var user: User4

    var body: some View {
        VStack {
            Text("User name: \(user.name)")
            Button(action: {
                self.user.name = "Jane Doe"
            }) {
                Text("Change name")
            }
            ObserveUserView(user: user)
        }
    }
}

struct ObserveUserView: View {
    @ObservedObject var user: User4

    var body: some View {
        VStack {
            Text("User name: \(user.name)")
            Button(action: {
                self.user.name = "John Doe"
            }) {
                Text("Change name")
            }
        }
    }
}

struct ContentView4: View {
    var body: some View {
        CreateUserView(user: User4())
    }
}
