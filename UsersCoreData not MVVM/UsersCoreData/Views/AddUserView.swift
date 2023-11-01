//
//  AddUserView.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI

struct AddUserView: View {
    
    @Environment(\.managedObjectContext) private var managedObjContext
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var dob: Date = Date()
    @State private var country: String = ""
    @State private var gender: String = "Male"
    let genderChoice = ["Male", "Female"]
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(header: Text("Name and location")){
                    TextField("Enter your name", text: $name)
                    TextField("Enter your country", text: $country)
                    DatePicker(selection: $dob, in:...Date(), displayedComponents: [.date]){
                        Text("Date of Birth")
                    }
                    
                    Picker("Gender", selection: $gender) {
                        ForEach(genderChoice, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Contact")) {
                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                }
                
            }.navigationTitle("Add user")
                .navigationBarItems(trailing: Button("Save"){
                    //action
                    // managedObjContext.save()
                    CoreDataStack.shared.addUser(name: name, gender: gender, email: email, dob: dob, country: country, managedObjContext: managedObjContext)
                    //dismiss the view
                    presentationMode.wrappedValue.dismiss()
                    dismiss()
                })
        }
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddUserView()
        }
    }
}

