//
//  ApiManange.swift
//  MVVMLesson1
//
//  Created by Hanh Vo on 2/15/23.
//

import Foundation

class ApiManager {
    
    static var shared = ApiManager()
    func fetchData(completionHandler: @escaping([User])-> Void) {
      let api = "https://jsonplaceholder.typicode.com/todos"
      guard let url = URL(string: api) else { return }
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        do {
           if let data = data {
             let result = try JSONDecoder().decode([User].self, from: data)
             DispatchQueue.main.async {
               completionHandler(result)
             }
           } else {
             print("No data")
           }
        } catch (let error) {
           print(error.localizedDescription)
        }
       }.resume()
    }
}
