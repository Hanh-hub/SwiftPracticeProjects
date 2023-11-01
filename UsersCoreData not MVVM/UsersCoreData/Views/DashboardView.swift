//
//  DashboardView.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI
import CoreData

struct DashboardView: View {
   let name = ["john",  "Kelly", "Johan"]
    @Environment(\.managedObjectContext) private var managedObjContext
    @State var showAddUserView: Bool = false
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    

    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(users, id: \.self){
                        user in
                        NavigationLink(destination: DetailView(user: user)){
                            Text(user.name ?? "Username Not Found")
                        }.swipeActions {
                            Button("Delete") {
                                deleteUser(user: user)
                            }
                            .tint(.red)
                        }
                    }
                }
            }
        }.navigationTitle("User Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                   //Button to show AddUserView
                    Button{showAddUserView.toggle()} label: {
                       Text("add user")
                       Image(systemName: "plus.circle")
                        //Label("Add User", systemImage: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showAddUserView){AddUserView()}
    }
    private func deleteUser(user: User){
        managedObjContext.delete(user)
        do{
            try managedObjContext.save()
        }
        catch{
            print("Error deleting user: \(error.localizedDescription)")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DashboardView()
        }
        
    }
}
