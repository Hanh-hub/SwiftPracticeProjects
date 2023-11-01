import SwiftUI

class User: ObservableObject {
    @Published var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct ContentViewX: View {
    @ObservedObject var user: User

    var body: some View {
        VStack {
            Text("Hello, \(user.name)")
            TextField("Enter your name", text: $user.name)
        }
    }
}

struct ContentViewX_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewX(user: User(name: "John"))
    }
}
