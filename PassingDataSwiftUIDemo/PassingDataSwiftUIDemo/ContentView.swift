//
//  ContentView.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ViewA(textA: "View A")
           
        }
        .padding()
    }
}

struct ViewA: View {
    @State var textA: String
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This is View A")
            
            TextField("Text", text: $textA)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .cornerRadius(50.0)
            
            Text(textA)
            
            NavigationLink( destination: ViewB(textB: textA), label: {
                Text("Sign In")})

        }
    }
}


struct ViewB: View {
    var textB: String
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This  is view B")
            Text(textB)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.cyan)
                .cornerRadius(50.0)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
