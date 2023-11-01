//
//  Model.swift
//  SwiftUIParseJson
//
//  Created by Hanh Vo on 2/13/23.
//

import Foundation

struct Pinterest: Decodable {
    let status: String?
//    let code: Int?
//    let message: String?
//    let endpointName: String?
    let data: Data?
}

struct Data: Decodable {
    let pins: [Pin]?
   
   
}

struct Pin: Decodable {
    //var id: String
    let images: Images?
   
//    let dominantColor: String?
//    let id: String?
//    let description: String?
//    let repinCount: Int?
//    let domain: String?
//    let link: String?
//    let aggregatedPinData: AggregatedPinData?
//    let pinner: Pinner?
//    let isVideo: Bool?
}


struct Images: Decodable {
    let x237: ImageData?
    let x564: ImageData?
}

struct ImageData: Decodable {
    let width: Int?
    let height: Int?
    let url: String?
}


//struct AggregatedPinData: Codable {
//    let aggregatedStats: AggregatedStats?
//
//    struct AggregatedStats: Codable {
//        let saves: Int?
//        let done: Int?
//    }
//}
   

//struct Pinner: Codable {
//    let about: String?
//    let pinCount: Int?
//    let id: String?
//    let fullName: String?
//    let profileUrl: String?
//    let imageSmallUrl: String?
//    let followerCount: Int?
//}
