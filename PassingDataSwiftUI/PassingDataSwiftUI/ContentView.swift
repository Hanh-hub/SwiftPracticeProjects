////
////  ContentView.swift
////  PassingDataSwiftUI
////
////  Created by Hanh Vo on 2/5/23.
////
//
//import SwiftUI
//
//// ViewA
//struct ViewA: View {
//    var text: String
//    var body: some View {
//        VStack {
//            Text(text)
//            Button(action: {
//                //self.text = "Goodbye World"
//            }) {
//                Text("Next")
//            }
//        }
//    }
//}
//
//
//struct ViewB: View {
//    @Binding var text: String
//
//    var body: some View {
//        VStack {
//            Text("view B")
//            Text(text)
//            Button(action: {
//               self.text = "Goodbye World"
//            }) {
//                Text("Next")
//            }
//        }
//    }
//}
//
//
//// Usage
//struct ContentView: View {
//    @State var text: String = "Hello World"
//
//    var body: some View {
//        
//        
//        NavigationView {
//            ViewA(text: text)
//                .navigationBarTitle("View A")
//                .navigationBarItems(trailing:
//                    NavigationLink(destination: ViewB(text: $text)) {
//                        Text("Next")
//                    }
//                )
//                
//    
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
