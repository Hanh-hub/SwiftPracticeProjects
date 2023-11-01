//
//  ViewModel.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import Foundation
import CoreData
import SwiftUI
class UserViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var managedObjContext
    var users: [User] = [User]()
    
    func fetchUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        do {
            users = try managedObjContext.fetch(request)
            //<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>
        }
        catch let error {
            print("Error getting user \(error.localizedDescription)")
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
