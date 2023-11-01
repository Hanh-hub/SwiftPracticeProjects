//
//  ContentView.swift
//  UserMVVM
//
//  Created by Hanh Vo on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var managedObjContext
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)],
            animation: .default)
        private var users: FetchedResults<User>
    
    var names = ["Johnny", "Kelly", "Kevin"]
    
    var body: some View {
        NavigationView{
            VStack {
                
               
                
                List {
                    ForEach(users) {user in
                        NavigationLink(destination: DetailUser(with: user)){
                        Text(user.name ?? "No name")
                        }
                    }.onDelete(perform: deleteUser)
                }
            }
        }.navigationTitle("Users")
            .navigationBarItems(trailing: NavigationLink(destination: DetailUser(), label: {
                Image(systemName: "plus.circle")
            }))
    }
    
    func deleteUser(at offsets: IndexSet){
        for index in offsets {
            let user: User = self.users[index]
            managedObjContext.delete(user)
        }
        do {
            try managedObjContext.save()
            
        }
        catch{
            print("unable to delete \(error)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView().environment(\.managedObjectContext, DataController.shared.container.viewContext)
        }
    }
}
