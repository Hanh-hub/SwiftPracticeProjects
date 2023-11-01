//
//  ViewVsBound.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/4/23.
//

import SwiftUI

struct ViewVsBound: View {
    var body: some View {
        VStack {
                   Text("Hello World")
                .frame(width: 200, height: 100)
                       .background(Color.red)
                       

                   Text("Bounds Example")
                       .background(Color.yellow)
                       .frame(width: 200, height: 100, alignment: .bottomTrailing)
                       
               }
        
     
    }
}

struct ViewVsBound_Previews: PreviewProvider {
    static var previews: some View {
        ViewVsBound()
    }
}


