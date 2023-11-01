//
//  Demo5.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/8/23.
//

import SwiftUI

struct Product: Identifiable {
    let id: UUID
    let name: String
}

enum Tab {
    case productPage
    case cartPage
   // case addProducPage
}

struct AddProductView: View {
    @ObservedObject var viewModel: ShoppingCart

    var body: some View {
        VStack {
            Button("Add to Cart") {
                self.viewModel.addProduct(product: Product(id: UUID(),
                                                           name: "Product\(UUID())"))
            }
            Image(systemName: "cart")
            Text("\(viewModel.count)")

            List {
                ForEach(viewModel.items, id: \.id) { item in // Use the id property for uniqueness
                    Text(item.name)
                }
            }
        }
    }
}


struct ParentView: View {
    
    @ObservedObject var cartViewModel: ShoppingCart = ShoppingCart()
    @State var selectedTab: Tab = .productPage

    var body: some View {
        
        TabView(selection: $selectedTab) {
            NavigationView {
                ProductPage(viewModel: cartViewModel)
            }
            .tabItem {
                Image(systemName: "house")
            }
            .tag(Tab.productPage)
            
            NavigationView {
                AddProductView(viewModel: cartViewModel)
            }
            .tabItem {
                Image(systemName: "cart")
                Text("\(cartViewModel.count)")
            }
            .tag(Tab.cartPage)
       
        }
    }
}


struct ContentView: View{
    var body: some View {
        NavigationStack{
            NavigationLink(destination: ParentView()){
                Text("Click here to start shopping")
            }
        }
    }
}


struct Demo5_Previews: PreviewProvider {
    static var previews: some View {
    //TabBarView()
       ContentView()
    }
}
