//
//  ContentView.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var  viewContext
    
    @State var showingAddView: Bool = false
    var viewModel: ViewModel
    init(viewModel: ViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
               Text("Budget")
               Text("Cost")
            }.sheet(isPresented: $showingAddView) {
                //AddBudgetView
                AddBudgetView(viewModel: AddBudgetViewModel(context: viewContext))
            }
        }.navigationTitle("Budgets")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add new budget"){
                        
                        showingAddView = true
                        
                        
                    }
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewContext = CoreDataStack.shared.managedObjContext
        NavigationView {
            ContentView(viewModel: ViewModel(context: viewContext))
        }
    }
}
