//
//  Model.swift
//  Mock1
//
//  Created by Hanh Vo on 3/16/23.
//

import Foundation


struct Response: Codable {
    var results: [ResultData]
    
}

struct ResultData: Codable {
  
    let fsq_id: String
    let name: String?
    let timezone: String?
}
