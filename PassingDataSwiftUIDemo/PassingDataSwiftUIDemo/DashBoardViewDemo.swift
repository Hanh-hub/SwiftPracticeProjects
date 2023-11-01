//
//  DashBoardViewDemo.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/3/23.
//

import SwiftUI



//
//  DashboardView.swift
//  PassingDataSwiftUIDemo
//
//  Created by Hanh Vo on 2/3/23.
//

import SwiftUI

struct DashboardViewDemo: View {
    //@StateObject var isOn = LightSampleDemo()
    @ObservedObject var isOn = LightSampleDemo()
    //@StateObject var isOn = LightSampleDemo()
    var body: some View {
        VStack{
            LightViewDemo(isOn: isOn.isOn)
            Divider()
            LightSwitchViewDemo(isOn: isOn)
        }
       
    }
}

struct DashboardViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewDemo()
    }
}

class LightSampleDemo: ObservableObject {
    @Published var isOn: Bool = true
}

struct LightViewDemo: View {
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
struct LightSwitchViewDemo: View {
    //@StateObject var isOn = LightSample()
    @ObservedObject var isOn = LightSampleDemo()
    var body: some View {
        VStack{
            Text("light switch view")
            Toggle(isOn: $isOn.isOn){
                Text("hello")
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.4))
        
    }
      
}
