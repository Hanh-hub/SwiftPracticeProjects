//
//  StateObjectDemo.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/3/23.
//

import SwiftUI

class CountModel: ObservableObject {
    @Published var count = 0
}

struct CountView: View {
    @StateObject var model = CountModel()
    //@StateObject var model = Model()
   // var model: CountModel

    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") {
                self.model.count += 1
            }
        }
    }
}

struct SecondViewX: View {
    @StateObject private var model = CountModel()
    var body: some View {
        CountView(model: model)
    }
}
struct ThirdViewX: View {
    @StateObject private var model = CountModel()
    var body: some View {
        CountView(model: model)
    }
}

struct StateObjectDemo: View {
    
    var body: some View {
        VStack {
            CountView()
            Divider()
            CountView()
        }
    }
}

struct StateObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectDemo()
    }
}



