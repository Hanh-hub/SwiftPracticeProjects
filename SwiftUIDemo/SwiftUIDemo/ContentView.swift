//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Hanh Vo on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        Text("ok").padding(.all,70.0).background(Color.blue
            .blur(radius: /*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/))
        
        Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct dog: Codable{
    var name: String
}
