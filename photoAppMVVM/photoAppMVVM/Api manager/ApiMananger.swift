//
//  ApiMananger.swift
//  photoAppMVVM
//
//  Created by Hanh Vo on 1/23/23.
//

import Foundation

class ApiMananger {
    
    func fetchApi(url: String, completionHandler: @escaping (Data)->Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if data == nil || error != nil {
                print(error?.localizedDescription ?? "error")
            }
            else {
                do {
                    let parsingData = try JSONDecoder().decode([Photo].self, from: data!)
                    
                    completionHandler(parsingData)
                   
                } catch{
                    print(error)
                }
            }
            
        }
        
        
    }
}
