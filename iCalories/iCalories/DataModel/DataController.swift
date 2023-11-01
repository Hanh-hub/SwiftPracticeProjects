//
//  DataController.swift
//  iCalories
//
//  Created by Hanh Vo on 2/16/23.
//

import Foundation
import CoreData

/*
 guard let modelURL = Bundle.main.url(forResource: "FoodModel", withExtension: "momd") else {
     fatalError("Unable to find data model in app bundle")
 }

 guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
     fatalError("Unable to create data model from \(modelURL)")
 }
 
 let container = NSPersistentContainer(name: "FoodMode", managedObjectModel: mom)
 
 
 */

class DataController: ObservableObject {
    //let container: NSPersistentContainer
    
//    init(){
//        guard let modelURL = Bundle.main.url(forResource: "FoodModel", withExtension: "momd") else {
//            fatalError("Unable to find data model in app bundle")
//        }
//
//        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
//            fatalError("Unable to create data model from \(modelURL)")
//        }
//        container = NSPersistentContainer(name: "FoodMode", managedObjectModel: mom)
//
//    }
    let container = NSPersistentContainer(name: "FoodModel")
    // NSPersistentContainer provides a pre-configured implementation of the Core Data stack that includes an NSManagedObjectContext, an NSPersistentStoreCoordinator, and an NSManagedObjectModel.
    
    init(){
        self.container.loadPersistentStores {description, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save (context: NSManagedObjectContext){
        do {
            try context.save()
            print("data saved")
        }
        catch{
            print("error saving data")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        save(context: context)
        
    }  
    
    
    
    
}


