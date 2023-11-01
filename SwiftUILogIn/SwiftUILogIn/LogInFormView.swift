//
//  LogInFormView.swift
//  SwiftUILogIn
//
//  Created by Hanh Vo on 1/30/23.
//

import SwiftUI



struct LogInFormView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var image: UIImage = UIImage()
    
    let url = URL(string: "https://wallpapercave.com/wp/wp2488779.jpg")
    
    var body: some View {
        
        
        VStack {
            AsyncImage(url: url!){
                image in
                image.resizable() }
        
        placeholder: {
                    Image(systemName: "brain.head.profile")
                        .foregroundColor(.mint)
                        .font(.system(size: 100))
                }
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //content: <#T##(Image) -> View#>, placeholder: <#T##() -> View#>)
                    

            TextField("Username", text: $username)
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                .padding(.vertical)
            
            SecureField("Password", text: $password)
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                .padding(.vertical)
            
            
            
    
            
            Button(action: {
                // Perform login action
                print("log in")
                isLoading = true
            }) {
                Text("Login")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5.0)
        }  .padding()
            
            .background(Color("CustomeColor").opacity(0.5))
            .sheet(isPresented: $isLoading) {
                DetailView(userName: $username)
            }
      
       
    }
}


struct LogInFormView_Previews: PreviewProvider {
    static var previews: some View {
        LogInFormView()
    }
}
