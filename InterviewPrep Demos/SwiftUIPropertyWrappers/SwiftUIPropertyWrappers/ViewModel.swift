//
//  ViewModel.swift
//  SwiftUIPropertyWrappers
//
//  Created by Hanh Vo on 7/19/23.
//

import Foundation

class ShoppingCart: ObservableObject {
    @Published var items = [Product]()
    
    var count: Int {
        return items.count
    }
    
    func addProduct(product: Product){
        self.items.append(product)
    }
        
    
    deinit {
        print("View model deallocated")
    }
}
