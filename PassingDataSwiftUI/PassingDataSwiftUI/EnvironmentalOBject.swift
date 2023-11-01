//
//  EnvironmentalOBject.swift
//  PassingDataSwiftUI
//
//  Created by Hanh Vo on 2/6/23.
//

import SwiftUI

class TextStore: ObservableObject {
    @Published var text: String = ""
}

struct ViewA: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter text", text: $text)
                NavigationLink(destination: ViewB()) {
                    Text("Next")
                }
            }
        }
    }
}


struct ViewB: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ViewC()) {
                    Text("Next")
                }
            }
        }
    }
}



struct ViewC: View {
    @EnvironmentObject var textStore: TextStore
    
    var body: some View {
        Text(textStore.text)
    }
}



struct EnvironmentalOBject: View {
    var body: some View {
        ViewA()
    }
}

struct EnvironmentalOBject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentalOBject()
    }
}
