//
//  ButtonView.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/25/23.
//

import Foundation
import SwiftUI

struct MyView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                print("Button tapped")
            }) {
                Text("Click me")
            }
            
            TextField("Enter some text", text: $text)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
            
            Text(text)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

