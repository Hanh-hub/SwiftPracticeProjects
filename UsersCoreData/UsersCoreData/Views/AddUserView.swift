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
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var selectedImage: UIImage = UIImage()
    @State var showImagePicker = false
    
//    
//    @State private var name: String = ""
//    @State private var email: String = ""
//    @State private var dob: Date = Date()
//    @State private var country: String = ""
//    @State private var gender: String = "Male"
    let genderChoice = ["Male", "Female"]
    
    
    var body: some View {
        
        NavigationView{
            Form{
                
                Section(header: Text("Profile Picture")){
                    VStack {
                        Button(action: {
                                    self.showImagePicker = true
                            
                                if let imageData = selectedImage.jpegData(compressionQuality: 1.0)
                            {self.userViewModel.profilePicture = imageData}
                                }) {
                                    Image(uiImage: (selectedImage ))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .background(Color.black.opacity(0.2))
                                    Text("Choose photo")
                                    
                                }.sheet(isPresented: $showImagePicker) {
                                    ImagePicker(image: self.$selectedImage)
                                }
                    }
                }
                
                Section(header: Text("Name and location")){
                    
                    TextField("Enter Your name", text: $userViewModel.name)
                    
                    TextField("Enter your country", text: $userViewModel.country)
                    DatePicker(selection: $userViewModel.dob, in:...Date(), displayedComponents: [.date]){
                        Text("Date of Birth")
                    }
                    
                    Picker("Gender", selection: $userViewModel.gender) {
                        ForEach(genderChoice, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Contact")) {
                    TextField("Enter your email", text: $userViewModel.email)
                        .keyboardType(.emailAddress)
                    TextField("Enter your phone number", text: $userViewModel.phoneNumber).keyboardType(.phonePad)
                }
                
                
            }.navigationTitle("Add user")
                .navigationBarItems(trailing: Button("Save"){
                    userViewModel.addUser()
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

