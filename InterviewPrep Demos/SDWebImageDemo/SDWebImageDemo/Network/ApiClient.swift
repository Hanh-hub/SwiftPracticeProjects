//
//  ApiClient.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/10/23.
//

import Foundation
import Alamofire

class ApiClient {
    static let shared = ApiClient()
    
    func fetchApi(url: String, completion: @escaping (Result<[Product], Error>) -> Void){
        print("calling api")
        AF.request(url).responseDecodable(of: ProductList.self) { response in
            switch response.result  {
            case .success( let productList):
                print(productList.products)
                completion(.success(productList.products))
            case .failure( let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}


