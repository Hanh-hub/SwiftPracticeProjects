import SwiftUI

class Model: ObservableObject {
    @Published var count = 0
}

struct ContentViewDemo: View {
    @ObservedObject var model: Model
    init(model: Model){
        self.model = model
    }
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") {
                self.model.count += 1
            }
        }
    }
}

struct SecondView: View {
    var model: Model
    init(model: Model){
        self.model = model
    }
    var body: some View {
        VStack{
            Text("this is second view")
            ContentViewDemo(model: model)
        }
    }
}

struct ThirdView: View {
   var model: Model
    init(model: Model){
        self.model = model
    }
    var body: some View {
        VStack{
            Text("this is Third view")
            ContentViewDemo(model: model)
        }
    }
}

struct AppView: View {
   
    var body: some View {
        let model = Model()
        VStack {
            SecondView(model: model)
            Divider()
            ThirdView(model: model)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}


