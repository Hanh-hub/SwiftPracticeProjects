import SwiftUI

class StateObjectDemo1: ObservableObject {
    @Published var count: Int = 0
}

struct StateObjectView1: View {
    @StateObject var stateObjectDemo = StateObjectDemo1()

    var body: some View {
        VStack {
            Text("Count: \(stateObjectDemo.count)")
            Button(action: {
                self.stateObjectDemo.count += 1
            }) {
                Text("Increment")
            }
        }
    }
}

struct ObservedObjectView1: View {
    @ObservedObject var stateObjectDemo: StateObjectDemo1

    var body: some View {
        VStack {
            Text("Count: \(stateObjectDemo.count)")
            Button(action: {
                self.stateObjectDemo.count += 1
            }) {
                Text("Increment")
            }
        }
    }
}

struct ContentView1: View {
    var body: some View {
        VStack {
            StateObjectView1()
            ObservedObjectView1(stateObjectDemo: StateObjectDemo1())
        }
    }
}

struct ContenView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
        
    }
}
