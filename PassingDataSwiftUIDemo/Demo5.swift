//
//  Demo5.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/8/23.
//

import SwiftUI

struct Demo5: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Demo5_Previews: PreviewProvider {
    static var previews: some View {
    //TabBarView()
        ContentABCView()
    }
}


class ShoppingCart: ObservableObject {
    @Published var items = ["Product B", "Product C"]
    var count: Int {
        return items.count
    }
}

struct ProductDetailView: View {
    @StateObject var cart = ShoppingCart()
    //@ObservedObject var cart: ShoppingCart

    var body: some View {
        VStack {
            Text("Product Detail View")
            Button("Add to Cart") {
                self.cart.items.append("Product A")
            }
            Image(systemName: "cart")
            Text("\(cart.count)")
            
            List {
                          ForEach(cart.items, id: \.self) { item in
                              Text(item)
                          }
                      }
        }
    }
}

struct ParentView: View {
    
    @ObservedObject var cart = ShoppingCart()

    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: ProductDetailView(cart: cart)) {
              Text("Detailed Car View")
                Image(systemName: "cart")
                Text("\(cart.count)")
            }
            
//            TabView {
//                ProductDetailView(cart: cart)
//                    .tabItem {
//                        Image(systemName: "cart")
//                        Text("\(cart.count)")
//                    }
//            }
        }
        
    }
}


struct ContentABCView: View{
    var body: some View {
        NavigationStack{
            NavigationLink(destination: ParentView()){
                Text("Parent View")
            }
        }
    }
}

