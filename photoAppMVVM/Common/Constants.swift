//
//  Constants.swift
//  photoAppMVVM
//
//  Created by Hanh Vo on 1/22/23.
//

import Foundation

enum API {
    static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    static let photos = baseURL.appendingPathComponent("photos")
}

