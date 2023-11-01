//
//  DataController.swift
//  CoreDataBookWorm
//
//  Created by Hanh Vo on 2/17/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm") //data model
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("data failed to load " , error.localizedDescription)
            }
        }
    }
}

