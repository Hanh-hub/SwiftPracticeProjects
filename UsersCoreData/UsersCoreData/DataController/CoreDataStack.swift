//
//  CoreDataStack.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject{
    static var shared = CoreDataStack()
    
    //create managedObjectContext
    let container: NSPersistentContainer = NSPersistentContainer(name: "UserModel")
    init(){
        self.container.loadPersistentStores{ desscription, error in
            if let error = error {
                print("error loading data ", error)
            }
        }
    }
    
}

