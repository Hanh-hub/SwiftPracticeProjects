//
//  Model.swift
//  MVVMLesson1
//
//  Created by Hanh Vo on 2/14/23.
//

import Foundation


//struct User: Decodable{
//    let userId: String?
//    let id: Int
//    let title: String?
//    let completed: Bool?
//}

struct User: Decodable {
    let userId: Int?
   let id: Int
   
   let title: String?
   let completed: Bool?
}
