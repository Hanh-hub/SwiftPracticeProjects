//
//  ViewModel.swift
//  MVVMLesson1
//
//  Created by Hanh Vo on 2/14/23.
//

import Foundation

class ContentViewModel: ObservableObject {
  @Published var items = [User]()
    func loadData(){
        ApiManager.shared.fetchData{
            result in
            self.items = result
        }
    }
}





