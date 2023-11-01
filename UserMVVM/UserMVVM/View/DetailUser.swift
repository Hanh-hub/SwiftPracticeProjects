//
//  DetailUser.swift
//  UserMVVM
//
//  Created by Hanh Vo on 2/28/23.
//

import SwiftUI
import Foundation
import UIKit

struct DetailUser: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel: UserViewModel //= UserViewModel()
    @State private var showImagePicker: Bool = false
    @State var selectedImage: UIImage = UIImage(systemName:"person.circle.fill" ) ?? UIImage()
    let genderChoice = ["Female", "Male"]
    
    init(with user: User? = nil){
        self.viewModel = UserViewModel(with: user)
    }
     
    
    //add new user: user = nil
    // pass user to viewModel
    var body: some View {
        VStack{
            
            Button(action: {callImagePicker()}){
                Image(uiImage: UIImage(data: viewModel.profilePicture) ?? selectedImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
                Text("Choose Photo")
            }.sheet(isPresented: $showImagePicker, content: {ImagePicker(image: $selectedImage)})
            
            Form {
                
                Section(header: Text("Name and location")){
                    TextField("Enter Your name", text: $viewModel.name)
                    TextField("Enter your country", text: $viewModel.country)
                    
                    DatePicker(selection: $viewModel.dob, in:...Date(), displayedComponents: [.date]){
                        Text("Date of Birth")
                    }
                    
                    Picker("Gender", selection: $viewModel.gender) {
                        ForEach(genderChoice, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section(header: Text("Contact")){
                    TextField("Enter your email", text: $viewModel.email)
                    TextField("Enter your phone number", text: $viewModel.phoneNumber)
                }
            }
        }.navigationTitle("User Detail")
            .navigationBarItems(trailing: Button("Save", action: {saveButton()}))
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))}
        
    }
    
    func callImagePicker(){
        self.showImagePicker = true
        if let imageData = selectedImage.pngData() {
            self.viewModel.profilePicture = imageData
        }
    }
    
    func saveButton(){
        let isValid = viewModel.validateInputs()
                               // If the input is valid, save the user to CoreData
        if isValid {
            self.viewModel.saveToCoreData()
            dismiss()
        }
    }
}

struct DetailUser_Previews: PreviewProvider {
    static var previews: some View {
        DetailUser()
    }
}
