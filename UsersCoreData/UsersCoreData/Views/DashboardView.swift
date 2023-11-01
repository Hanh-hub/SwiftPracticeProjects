//
//  DashboardView.swift
//  UsersCoreData
//
//  Created by Hanh Vo on 2/21/23.
//

import SwiftUI
import CoreData

struct DashboardView: View {

    @Environment(\.managedObjectContext) private var managedObjContext
    @State var showAddUserView: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(userViewModel.users){
                        user in
                        NavigationLink(destination: DetailView(user: user).environmentObject(userViewModel)){
                            Text(user.name ?? "Username Not Found")
                        }.swipeActions {
                            Button("Delete") {
                                userViewModel.deleteUser(user: user)
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
                    }
                }
            }
            .sheet(isPresented: $showAddUserView){AddUserView().environmentObject(userViewModel)}
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            DashboardView().environmentObject(UserViewModel())
        }
    }
}
