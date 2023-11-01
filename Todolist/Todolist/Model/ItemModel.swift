//
//  ItemModel.swift
//  Todolist
//
//  Created by Hanh Vo on 1/30/23.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
