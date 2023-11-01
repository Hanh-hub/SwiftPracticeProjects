//
//  ApiCaller.swift
//  Pagination
//
//  Created by Hanh Vo on 1/29/23.
//

import Foundation


class APICaller {
    
    var isPaginating = false
    func fetchData(pagination: Bool = false, completionHandler: @escaping (Result<[String], Error>)->Void) {
        
        
        
        if pagination{
            isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: {
            let originalData = Array(1...100).map { String($0) }
            
            let newData = ["Banaa", "ORgane", "Grape", "Apple"]
            completionHandler(.success(pagination ? newData : originalData))
            
            if pagination {
                self.isPaginating = false
            }
            
            
        })
    }
}
