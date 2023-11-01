//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Hanh Vo on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var data = [String]()

    var body: some View {
        VStack {
            Text("Data from server:")
            List(data, id: \.self) {
                Text($0)
            }
        }
        .task {
            do {
                let newData = try await fetchData()
                DispatchQueue.main.async {
                    self.data = newData
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func fetchData() async throws -> [String] {
        // Long-running task to fetch data from a server
        let url = URL(string: "https://example.com/data.txt")!
        let data = try await URLSession.shared.data(from: url)
        let stringData = String(data: data.0, encoding: .utf8)!
        return stringData.components(separatedBy: "\n")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
