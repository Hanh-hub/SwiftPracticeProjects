//
//  AddBudgetView.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/20/23.
//

import SwiftUI

struct AddBudgetView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddBudgetViewModel
    
    init(viewModel: AddBudgetViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $viewModel.name)
            TextField("Cost",text: $viewModel.cost)
            Button("Save"){
                //save to persistant store
                viewModel.save()
                presentationMode.wrappedValue.dismiss()
            }.centerHorizontally()
        }.navigationTitle("Add budget")
    }
      
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddBudgetView(viewModel: AddBudgetViewModel(context: CoreDataStack.shared.managedObjContext))
        }
        
    }
}
