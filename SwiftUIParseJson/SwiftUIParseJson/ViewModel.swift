//
//  ViewModel.swift
//  SwiftUIParseJson
//
//  Created by Hanh Vo on 2/13/23.
//


import Foundation

//https://api.pinterest.com/v3/pidgets/boards/ilyavedenin1/Apple/pins/

class ViewModel: ObservableObject {
    let url = "https://api.pinterest.com/v3/pidgets/boards/ilyavedenin1/Apple/pins/"
    @Published var pinsArray: [Pin] = []
   
    func fetchApi() {
        guard let urlRequested = URL(string: url) else {
            print("error getting url")
            return
        }
        
        URLSession.shared.dataTask(with: urlRequested){
            data, response, error in
            if data != nil || error == nil {
                do {
                    let parsingData = try JSONDecoder().decode(Pinterest.self, from: data!)
                  
                    
                    DispatchQueue.main.async {
                        self.pinsArray = parsingData.data?.pins ?? []
                        print(self.pinsArray)
                       
                    }
                     
                    
                } catch {
                    //catch error
                    print(error)
                }
            }
        }.resume()
    
    }
    
    
}

// class DynamicViewModel: ObservableObject {
//
//    let imageUrl = "https://jsonplaceholder.typicode.com/photos"
//
//    @Published var imagesList = [DynamicDataModel]()
//
//     init(imagesList: [DynamicDataModel] = [DynamicDataModel]()) {
//         self.imagesList = imagesList
//         print("dynamic class init")
//     }
//
//     deinit{
//         print("dynamic class deinit")
//     }
//
//     func getImagesList() {
//
//        guard let finalurl = URL(string: imageUrl) else { return }
//
//        URLSession.shared.dataTask(with: finalurl) { data, response, error in
//            if error == nil {
//
//                DispatchQueue.main.async {
//                    do {
//                        self.imagesList = try JSONDecoder().decode([DynamicDataModel].self, from: data!)
//                    }catch {
//                        self.imagesList = []
//                    }
//                }
//            }
//        }.resume()
//    }
//
//}
//
