//
//  DetailView.swift
//  SwiftUILogIn
//
//  Created by Hanh Vo on 1/30/23.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var userName:String
    
    var body: some View {
        TextField("Enter information", text: $userName)
            .font(.title3)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("PrimaryColor"))
        .cornerRadius(50)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userName: .constant(""))
    }
}
