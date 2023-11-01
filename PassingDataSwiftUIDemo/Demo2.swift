//
//  Demo2.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/6/23.
//

import SwiftUI

class InputText: ObservableObject {
    @Published var inputText: String = "Hello World"
}

struct AView: View {
   
    @EnvironmentObject var text: InputText
    
    var body: some View {
        VStack{
            Text("A View")
            TextField("sdgsdg", text: $text.inputText)
        
        }
       
        NavigationLink(destination: BView()){
            Text("Next")
        }
        
    }
}
struct BView: View {
    var body: some View {
        Text("B View")
        NavigationLink(destination: CView()){
            Text("Next")
        }
       // NavigationLink()
    }
}

struct CView: View {
    var body: some View {
        Text("C View")
        NavigationLink(destination: DView()){
            Text("Next")
        }
       // NavigationLink()
    }
}

struct DView: View {
    //@Binding var text: String
    @EnvironmentObject var text: InputText
    var body: some View {
        Text("D View")
        Text(text.inputText)
       // NavigationLink()
    }
}

struct FView: View {
    @ObservedObject var text: InputText = InputText()
    var body: some View {
       
        AView().environmentObject(text)
    }
}
struct Demo2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AView().environmentObject(InputText())
        }
        
    }
}
