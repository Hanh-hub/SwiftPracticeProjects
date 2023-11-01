//
//  ViewModel.swift
//  SpaceMVCDemo
//
//  Created by Hanh Vo on 1/22/23.
//

import Foundation



class ViewModel: ApiManagerDelegateProtocol{
   
    init(){
        ApiManager.shared.delegate = self
    }
    
    var launchArray =  [JSONData]()
    
    func sendData(arr: [JSONData]) {
        self.launchArray = arr
    }
    
    func getLaunchData(){
        //ApiManager.shared.fetchApiJSON()
//        ApiManager.shared.fetchClosure { parsingDatax in
//            self.launchArray = parsingDatax
//
        ApiManager.shared.fetchClosureEscaping(completionHandler: <#([JSONData]) -> ()#>)
        self.launchArray = parsingData
        }
    }
    
    
    
    func getDataAtRow(row: Int) ->JSONData{
        return launchArray[row]
    }
    
}

protocol viewModelDelegateProtocol{
    
}
