//
//  ContentView.swift
//  PhotoMania
//
//  Created by Hanh Vo on 1/20/23.
//

import SwiftUI


var url = "https://random.imagecdn.app/500/500"

class ViewModel: ObservableObject {
    @Published var image: Image?
    
    func fetchNewImage() {
        guard let url = URL(string: url)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {print(error ?? "no data")
                return
            }
            DispatchQueue.main.async {
                guard let uiImage = UIImage(data: data) else {return}
                        
                self.image = Image(uiImage: uiImage)
            }
            
        }.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
               
                if let image = viewModel.image {
                    image
                        .resizable()
                        .foregroundColor(Color.pink)
                        .frame(width: 300, height: 300)
                        .padding()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(Color.pink)
                        .frame(width: 300, height: 300)
                        .padding()
                    
                }
                
                Spacer()
                    .padding(.all, 60.0)
                
                Button(action: {
                    //do sth
                    viewModel.fetchNewImage()
                }, label: {
                    Text("New Image")
                        .bold()
                        .frame(width: 250, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding()
                    
                })
                
                
            }.navigationTitle("Photo Mania")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
