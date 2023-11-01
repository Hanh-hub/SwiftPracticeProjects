//
//  UserViewModel.swift
//  UserMVVM
//
//  Created by Hanh Vo on 2/28/23.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    private var viewContext = DataController.shared.container.viewContext
    
    @Published var name: String = ""
    @Published var gender: String = "Female"
    @Published var country: String = ""
    @Published var email: String = ""
    @Published var dob: Date = Date()
    @Published var phoneNumber: String = ""
    @Published var profilePicture: Data =  Data()
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    private var user: User?
    
    init(with user: User? = nil){
        self.user = user
        
        //if there is user
        if let user = user {
            self.name = user.name ?? "No Name Entered"
            self.country = user.country ?? "No country entered"
            self.phoneNumber = user.phoneNumber ?? "No phone number entered"
            self.profilePicture = user.profilePicture ?? UIImage().pngData()!
            self.dob = user.dob ?? Date()
            self.email = user.email ?? "No email provided"
            self.gender = user.gender ?? "Female"
        }
    }
    
    func saveToCoreData() {
        //save changes to existing user
        if let user = self.user {
            user.name = self.name
            user.country = self.country
            user.email = self.email
            user.dob = self.dob
            user.phoneNumber = self.phoneNumber
            user.profilePicture = self.profilePicture
        } else {
            //saving new user
            let newUser = User(context: viewContext)
            newUser.id = UUID()
            newUser.name = self.name
            newUser.country = self.country
            newUser.email = self.email
            newUser.dob = self.dob
            newUser.phoneNumber = self.phoneNumber
            newUser.profilePicture = self.profilePicture
        }
        //write to persistent store
        
        do {
            try viewContext.save()
        }
        catch {
           print("unable to save to persistent store")
        }
    }
    
    func validateInputs() -> Bool {
            // Validate the phone number and email address
        let phoneRegex = "^\\d{10}$"
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let phonePredicate = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let isValidPhone = phonePredicate.evaluate(with: self.phoneNumber)
        let isValidEmail = emailPredicate.evaluate(with: email)

            // Show an error message if the phone number or email is invalid
        if !isValidPhone {
                errorMessage = "Invalid phone number"
            } else if !isValidEmail {
                errorMessage = "Invalid email address"
            } else {
                return true
            }

            showError = true
            return false
        }
    
}
