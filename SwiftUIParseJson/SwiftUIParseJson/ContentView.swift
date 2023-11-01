

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            if viewModel.pinsArray.isEmpty {
                Text("Data Loading....")
                    .font(.largeTitle)
            }   else  {
                List() {
                    ForEach(viewModel.pinsArray,id: \.id) { pin in
                        
                        if let x564Image = pin.images?.x564, let imageURL = x564Image.url{
                            AsyncImage(
                                           url: URL(string: imageURL)!
                            ).frame(width: CGFloat(x564Image.width ?? 0), height: CGFloat(x564Image.height ?? 0))
                            
                        }
                        else {
                            Image(systemName: "person.fill")
                                .foregroundColor(.orange)
                                .padding()
                                .font(.system(size: 100))
                                .background(.mint)
                        }
                        
                    }
                }
                
            }
        }.onAppear {
            viewModel.fetchApi()}
        
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

