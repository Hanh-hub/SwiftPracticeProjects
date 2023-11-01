//
//  DataController.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/19/23.
//

import Foundation
import CoreData
//setting up a managed object context, persistent store coordinator, and managed object model.
//


class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BudgetModel")
        
        container.loadPersistentStores{ description, error in
            if let error = error as? NSError {
                print("error loading data \(error.userInfo)")
                fatalError("unable to initialize core data \(error)")
            }
        }
        return container
    }()
    
    //NSManagedObjectContext class,
    lazy var managedObjContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
