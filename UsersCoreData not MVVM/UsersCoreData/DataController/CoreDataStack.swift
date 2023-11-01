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
                print("error loading data ", error.localizedDescription)
            }
        }
    }
    
    func saveToCoreData(managedObjContext: NSManagedObjectContext){
        do {
           try  managedObjContext.save()
            print("Saved sucessfully)")
        } catch (let error){
            print("Unable to save \(error)")
        }
    }
    
    func addUser(name: String, gender: String, email: String, dob: Date, country: String, managedObjContext: NSManagedObjectContext ){
        let user = User(context: managedObjContext)
        user.name = name
        user.gender = gender
        user.email = email
        user.dob = dob
        user.country = country
        
        print("Saving to coreData")
       saveToCoreData(managedObjContext: managedObjContext)
    }
    
    func editUser(user: User, name: String, gender: String, email: String, dob: Date, country: String, managedObjContext: NSManagedObjectContext){
        user.name = name
        user.gender = gender
        user.email = email
        user.dob = dob
        user.country = country
        saveToCoreData(managedObjContext: managedObjContext)
    }
    
}

