//
//  DetailView.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI
import CoreData
struct DetailView: View {
    
    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    var user: FetchedResults<User>.Element
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var dob: Date = Date()
    @State private var country: String = ""
    @State private var gender: String = "Male"
    let genderChoice = ["Male", "Female"]
    
    init(user: FetchedResults<User>.Element) {
        self.user = user
        _dob = State(initialValue: user.dob ?? Date()) // initialize the selected date with the user's dob, or with the current date if the dob is nil
        _gender = State(initialValue: user.gender ?? "Male")
        }
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Name and location")){
                    TextField("\(user.name!)", text: $name).onAppear{
                        name = user.name!
                        country = user.country!
                        dob = user.dob!
                        gender = user.gender!
                        email = user.email!
                    }
                    TextField(user.country!, text: $country)
                   
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
                    TextField(user.email!, text: $email)
                        .keyboardType(.emailAddress)
                    
                }
                
            }.navigationTitle("Detail User")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Update User"){
                            CoreDataStack.shared.editUser(user: user, name: name, gender: gender, email: email, dob: dob, country: country, managedObjContext: manageObjContext)
                        }
                    }
                }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            DetailView()
//        }
//
//    }
//}
