//
//  ApiMananger.swift
//  Mock1
//
//  Created by Hanh Vo on 3/16/23.
//

import Foundation

class ApiMananger {
    static let shared = ApiMananger()
     
    func fetchDentalPlaces(completion: @escaping (Result<[ResultData], Error>) -> Void) {
        let urlString = "https://api.foursquare.com/v3/places/search?query=dental"
        guard let url = URL(string: urlString) else {
            print("invalid url")
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.setValue("fsq3pgbs4YXQvXal3XICRc8tzCc3c6Q0J0/rP7/0hHY3Usc=", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("there is error")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("no dataddd")
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            print("data", data)

            do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                print(decodedResponse)
                completion(.success(decodedResponse.results))
            } catch {
                print("no data")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    
    
    
    
    
//    func fetchApi(url: String, completion: @escaping (Data, Error) -> Void){
//        URLSession.shared.dataTask(with: URL(string: url)) { data, response, error in
//
//
//        }
//    }
    
}
