//
//  ListViewModel.swift
//  Todolist
//
//  Created by Hanh Vo on 1/30/23.
//

import Foundation


class ListViewModel: ObservableObject{
   @Published var items: [ItemModel] = []
    init() {
        getItems()
    }
    
    func getItems(){
       let newItems = [
             ItemModel(title: "This is the first title", isCompleted: false),
             ItemModel(title: "This is the second", isCompleted: true),
             ItemModel(title: "Thrd", isCompleted: true)
         ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    
}
