//
//  ButtonView.swift
//  ScrollView
//
//  Created by Hanh Vo on 3/12/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Click me", icon: "square.and.arrow.down.on.square.fill" , action: {print("hello")})
    }
}


