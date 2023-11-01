//
//  ListView.swift
//  Todolist
//
//  Created by Hanh Vo on 1/30/23.
//

import SwiftUI

struct ListView: View {
//
//  @State  var items: [ItemModel] = [
//  ItemModel(title: "Clean House", isCompleted: false),
//  ItemModel(title: "break up", isCompleted: true)
//  ]

    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        List {
            ForEach(listViewModel.items ) {
                item in
                ListRowView(item: item)
               // ListRowView(title: item)
            }.onDelete(perform: listViewModel.deleteItem)
           
            
            //ListRowView(title: "This is the first title")
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Todo List 😃")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView())
            )
    }
    
   
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
        
    }
}

