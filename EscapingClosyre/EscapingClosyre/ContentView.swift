//
//  ContentView.swift
//  EscapingClosyre
//
//  Created by Hanh Vo on 3/9/23.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData(){
        downloadData2{ returnedData in
            text = returnedData
            
        }
        //doSomething(forData: <#T##String#>)
    }
    
    func downloadData() ->String{
        return "Download data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
       // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            completionHandler("New Data 2")
      //  }
       
    }
    
    func doSomething(forData data: String){
        print(data)
    }
}
struct ContentView: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        VStack {
            Text(vm.text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor (.blue)
                .onTapGesture {
                    vm.getData()
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
