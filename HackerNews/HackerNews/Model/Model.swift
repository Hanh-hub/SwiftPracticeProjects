//
//  Model.swift
//  HackerNews
//
//  Created by Hanh Vo on 1/24/23.
//

import Foundation

enum SERVER : String {
    case getNews = "https://hn.algolia.com/api/v1/search?tags=front_page"
}


struct NewsModel : Decodable {
    
    var hits : [News]?
}


struct News : Decodable{

  //  let id: Int
    var title       : String?
    var serverUrl   : String?
    var points      : Int?
}
