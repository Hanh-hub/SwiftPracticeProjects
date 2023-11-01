//
//  AddFoodView.swift
//  iCalories
//
//  Created by Hanh Vo on 2/16/23.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var name = ""
    @State var calories = 0.0
    
    
    var body: some View {
        Form {
            Section {
                TextField("food name", text: $name)
                //TextField("calories",text: $calories)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0.0...1000.0, step: 5.0)
                }.padding()
                
                Button("Submit"){
                    DataController().addFood(name: name, calories: calories, context: managedObjContext)
                    dismiss()
                    
                }
                
                
                
               
                
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
