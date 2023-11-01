//
//  ViewModel.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/19/23.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    private (set) var viewContext: NSManagedObjectContext
    private let fetchResultsController: NSFetchedResultsController <Budget>
    init(context: NSManagedObjectContext){
        self.viewContext = context
        fetchResultsController = NSFetchedResultsController(fetchRequest: Budget.all, managedObjectContext: viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsController.delegate = self 
    }
    
    @Published var budgets = [BudgetViewModel]()
    
}
struct BudgetViewModel: Identifiable{
    private var budget: Budget
    
    init(budget: Budget) {
        self.budget = budget
    }
    
    var id: NSManagedObjectID {
        budget.objectID
    }
    
    var name: String{
        budget.name ?? ""
    }
    
    var cost: Double {
        budget.cost
    }
    
}

class AddBudgetViewModel: ObservableObject {
    private (set) var viewContext: NSManagedObjectContext
    
    @Published var name: String = ""
    @Published var cost: String = "0.0"
    
    init(context: NSManagedObjectContext){
        self.viewContext = context
    }
    
    func save() {
        let budget = Budget(context: viewContext)
        budget.name = name
        budget.cost = Double(cost)!
        
        do {
            //try viewContext.save()
            try budget.save()
        }
        catch (let error){
            print("error occured ", error.localizedDescription)
            
        }
    }
}
