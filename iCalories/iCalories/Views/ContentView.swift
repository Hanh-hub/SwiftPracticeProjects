//
//  ContentView.swift
//  iCalories
//
//  Created by Hanh Vo on 2/16/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    
    @State private var showingAddView: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 4){
                
                Button("Crash") {
                  fatalError("Crash was triggered")
                }
                
                Text(" \(Int(totalCaloriesToday())) kcal today ")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List{
                    ForEach(food){food in
                        
                        NavigationLink(destination: Text("\(food.calories)")) {
                            HStack{
                                VStack{
                                    Text(food.name!).bold()
                                    Text("\(Int(food.calories))") + Text("calories").foregroundColor(.red)
                                }
                                Spacer()
                                Text(calculateTimeScine(date:food.date!))
                                    .foregroundColor(.gray )
                                    .italic()
                            }
                        }
                        
                    }.onDelete(perform: deleteFood)
                }
            }.listStyle(.plain)
      
        }.navigationTitle("iCalories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    showingAddView.toggle()
                                } label: {
                                    Label("Add food", systemImage: "plus.circle")
                                }
                            }
                ToolbarItem(placement: .navigationBarLeading) {
                                EditButton()
                            }
                
            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
}
    

    
    private func totalCaloriesToday()->Double{
        return 19.0
        
    }
    
    private func deleteFood(offsets: IndexSet){
        withAnimation {
                   offsets.map { food[$0] }
                   .forEach(managedObjContext.delete)
                   
                   // Saves to our database
                   DataController().save(context: managedObjContext)
               }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView().environment(\.managedObjectContext, DataController().container.viewContext)
        }
        
    }
}
