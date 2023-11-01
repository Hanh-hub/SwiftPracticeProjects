//
//  DataController.swift
//  UserMVVM
//
//  Created by Hanh Vo on 2/28/23.
//

import Foundation
import CoreData
import UIKit


class DataController {
    static let shared = DataController()
    
    static let preview: DataController = {
        
        let result = DataController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for i in 0...5 {
            let user = User(context: viewContext)
            user.name = "Default User \(i)"
            user.phoneNumber = "000 000 000"
            user.email = "DefaulUser\(i)@gmail.com"
            user.dob = Date()
            user.country = "Vietnam"
            user.profilePicture = UIImage(systemName: "brain.head.profile")?.pngData() ?? Data()
        }
        
        do {
            try viewContext.save()
            print("writing to persistent store")
            
        }
        catch {
            let error = error as NSError
            fatalError("error saving to persistent store \(error)")
        }
        
        
        return result
    
        
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "UserModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/nul")
        }
        
        
        container.loadPersistentStores{description, error in
            if let error = error as? NSError {
                fatalError("error loading data \(error) \(error.userInfo)")
            }
        }
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            let count = try container.viewContext.count(for: request)
            print("there are \(count) users")
            if count == 0 {
                createDefaultUser(viewContext: container.viewContext)
            }
            if count > 5 {
                deleteAllUsers()
                createDefaultUser(viewContext: container.viewContext)
            }
        }
        catch {
            print("error getting counts for persistent store \(error)")
        }
        
    }
    
    func createDefaultUser(viewContext: NSManagedObjectContext){
        for i in 0...5 {
            let user = User(context: viewContext)
            user.id = UUID()
            user.name = "Default User \(i)"
            user.phoneNumber = "000 000 000"
            user.email = "DefaulUser\(i)@gmail.com"
            user.dob = Date()
            user.country = "Vietnam"
            user.profilePicture = UIImage(systemName: "brain.head.profile")?.pngData() ?? Data()
        }
        
        do {
            try viewContext.save()
        }
        catch {
            let error = error as NSError
            fatalError("unable to save data \(error)")
        }
    }
    
    func deleteAllUsers() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(batchDeleteRequest)
        } catch {
            // handle error
            print("error deleting users")
        }
    }
    
    
}
