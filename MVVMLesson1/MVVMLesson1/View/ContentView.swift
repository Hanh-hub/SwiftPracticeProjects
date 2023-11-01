//
//  ContentView.swift
//  MVVMLesson1
//
//  Created by Hanh Vo on 2/14/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                List(viewModel.items, id: \.id){ item in
                    VStack(alignment: .leading) {
                        Text(item.title ?? "Title not found")
                        Text(item.completed?.description ?? "Completed status not found")
                            .font(.system(size: 11))
                            .foregroundColor(.cyan)
                         
                    }
                }
                
            }.onAppear(perform: {viewModel.loadData()})
                .navigationBarTitle("To Do List")
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
