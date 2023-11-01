//
//  DashboardView.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/3/23.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var isOn = LightSample()
    var body: some View {
        VStack{
            LightView(isOn: isOn.isOn)
            Divider()
            LightSwitchView(isOn: $isOn.isOn)
        }
       
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

class LightSample: ObservableObject {
    @Published var isOn: Bool = true
}

struct LightView: View {
    let isOn: Bool
    //@StateObject var isOn = LightSample()
   
    var body: some View {
        VStack{
            Text("light view")
            
            if isOn {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 40))
            }
            else {
                Image(systemName: "lightbulb")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.4))
    }
}
struct LightSwitchView: View {
    //@StateObject var isOn = LightSample()
    @Binding var isOn: Bool
    var body: some View {
        VStack{
            Text("light switch view")
            Toggle(isOn: $isOn){
                Text("hello")
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.4))
        
    }
      
}
