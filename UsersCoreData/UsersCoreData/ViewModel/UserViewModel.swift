//
//  ViewModel.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import Foundation
import CoreData
import SwiftUI
class UserViewModel: ObservableObject{

    let managedObjContext: NSManagedObjectContext = CoreDataStack.shared.container.viewContext
    @Published var user: User?
    @Published var users: [User] = []
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var country: String = ""
    @Published var gender: String = "Female"
    @Published var dob: Date = Date()
    @Published var phoneNumber: String = ""
    @Published var profilePicture: Data = UIImage(named: "default-profile-picture")!.jpegData(compressionQuality: 1.0)!
    
    init(user: User? = nil) {
            self.user = user
            if let user = user {
                self.name = user.name ?? ""
                self.dob = user.dob ?? Date()
                self.email = user.email ?? ""
                self.phoneNumber = user.phoneNumber ?? ""
                self.country = user.country ?? ""
                self.profilePicture = user.profilePicture ?? Data()
            }
        fetchUsers()
        }
    
    func fetchUsers(){
        let request = NSFetchRequest<User>(entityName: "User")
        //let request: NSFetchRequest<User> = User.fetchRequest()
        //let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        do {
            users = try managedObjContext.fetch(request)
            //<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>
        }
        catch let error {
            print("Error getting user \(error)")
        }
    }
    
   
    
    func saveToCoreData(){
        do {
            try  managedObjContext.save()
            print("Saved sucessfully)")
        } catch (let error){
            print("Unable to save \(error)")
        }
    }
    
    func addUser() {
            let user = User(context: managedObjContext)
            user.name = name
            user.dob = dob
            user.email = email
            user.phoneNumber = phoneNumber
            user.country = country
            
            do {
                try user.managedObjectContext?.save()
            } catch {
                print(error)
            }
        users.append(user)
        }
    
//    func addUser(name: String, gender: String, email: String, dob: Date, country: String){
//        let user = User(context: managedObjContext)
//        user.name = name
//        user.gender = gender
//        user.email = email
//        user.dob = dob
//        user.country = country
//
//        print("Saving to coreData")
//        saveToCoreData()
//        users.append(user)
//    }
    
    
    
    
    func updateUser() {
            guard let user = user else {
                return
            }
            
            user.name = name
            user.dob = dob
            user.email = email
            user.phoneNumber = phoneNumber
            user.country = country
            
            do {
                try user.managedObjectContext?.save()
            } catch {
                print(error)
            }
        fetchUsers()
        }
    
    
    
    
    
//    func updatetUser(user: User, name: String, gender: String, email: String, dob: Date, country: String){
//        user.name = name
//        user.gender = gender
//        user.email = email
//        user.dob = dob
//        user.country = country
//        saveToCoreData()
//        fetchUsers()
//        //users.append(user)
//    }
    
    func deleteUser(user: User){
        managedObjContext.delete(user)
        do {
            try managedObjContext.save()
            if let index = users.firstIndex(of: user){
                users.remove(at: index)
                print("Successfully removed user")
                fetchUsers()
            }
        }
        catch let error {
            print("Error deleteing user \(error)")
        }
        
        
       // users.remove(at: index)
        
    }
    
    
}


extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool {
        let phoneNumberRegEx = "^[0-9]{10}$"
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberTest.evaluate(with: self)
    }
}
