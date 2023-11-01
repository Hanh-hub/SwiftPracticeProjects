//
//  Binding.swift
//  PassingDataSwiftUI
//
//  Created by Hanh Vo on 2/5/23.
//

import SwiftUI
struct ParentView: View {
    @State private var text: String = "Hello World"

    var body: some View {
        VStack {
            Text(text)
            Divider()
            
         NavigationLink(destination: ChildView(text: $text)) {
            Text("Go to Child Viewi")
        }
           
            //ChildView(text: $text)
        }.padding()
           
    }
}

struct ChildView: View {
    @Binding var text: String
    var body: some View {
        VStack {
            Text("child view")
            TextField("Enter text", text: $text)
        }
    }
}


struct GrandpaView: View {
    var body: some View {
        VStack {
           ParentView()
           
        }
    }
}

struct GrandpaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GrandpaView()
        }
        
        
    }
}
