//
//  Model.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/10/23.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
}




