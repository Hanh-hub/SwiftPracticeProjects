//
//  ContentView.swift
//  Mock1
//
//  Created by Hanh Vo on 3/16/23.
//

import SwiftUI

struct ContentView: View {
    let mockList = ["Olive oil", "Macdonal", "Dental office"]
    @State private var errorMessage: String = ""
    @State private var dentalPlaces: [ResultData] = []
       
    private func fetchAndDisplayDentalPlaces() {
        ApiMananger.shared.fetchDentalPlaces { result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let results):
                       self.dentalPlaces = results
                   case .failure(let error):
                       self.errorMessage = "Error: \(error.localizedDescription)"
                   }
               }
           }
       }
    
    var body: some View {
        VStack {
                   if !errorMessage.isEmpty {
                       Text(errorMessage)
                           .foregroundColor(.red)
                   }
                   
                   List(dentalPlaces, id: \.fsq_id) { dentalPlace in
                       Text(dentalPlace.name ?? "Name not found")
                   }
                   .onAppear {
                       fetchAndDisplayDentalPlaces()
                   }
               }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
