//
//  ContentView.swift
//  Singleton
//
//  Created by Hanh Vo on 3/13/23.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()

    var data: [String] = ["Apple", "Kiwi", "Water Melon"]

    private init() {}
}

class MockDataManager: DataManager {
    var mockData: [String]

       override var data: [String] {
           get {
               return mockData
           }
           set {
               // do nothing
           }
       }
    init(mockData: [String] = ["foo", "bar", "baz"]) {
        super.init()
        self.mockData = mockData
        }
}


struct ContentView: View {
    var body: some View {
        Text(DataManager.shared.data.joined(separator: ", "))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

