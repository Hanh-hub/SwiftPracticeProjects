//
//  Budget+Extensions.swift
//  CoreDataBudget
//
//  Created by Hanh Vo on 2/20/23.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get}
    func save() throws
    func delete() throws
}
extension BaseModel where Self: NSManagedObject  {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataStack.shared.managedObjContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}

extension Budget: BaseModel {
    static var all: NSFetchRequest<Budget> {
        let request = Budget.fetchRequest ()
        request.sortDescriptors = []
        return request
        }
}
