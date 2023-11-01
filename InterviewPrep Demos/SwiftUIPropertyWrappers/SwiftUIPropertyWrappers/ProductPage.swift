//
//  ProductPage.swift
//  SwiftUIPropertyWrappers
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI

struct ProductPage: View {
    @ObservedObject var viewModel: ShoppingCart
    var body: some View {
        VStack{
            Text("Product page")
            
            List(viewModel.items) {item in
                Text(item.name)
            }
        }
    }
}

struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage(viewModel: ShoppingCart())
    }
}
