//
//  ApiMananger.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/24/23.
//

import Foundation
import Combine


class ApiManager {
    
    func getNews(url: String, completionHandler: @escaping (NewsModel)->()){
        guard let url = URL(string: url) else {
            print("error getting url")
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if data == nil || error != nil {
                print("error getting data",(error?.localizedDescription)!)
            }
            else {
                do{
                    let parsingData = try JSONDecoder().decode(NewsModel.self, from: data!)
                    completionHandler(parsingData)
                } catch{
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func getNewsUsingCombineFrom(url:String) -> AnyPublisher<NewsModel,Error> {
        
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
        .decode(type: NewsModel.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
    
    
    
}
