//
//  ApiManager.swift
//  SpaceMVCDemo
//
//  Created by Hanh Vo on 1/22/23.
//

import Foundation


class ApiManager {
    
    static let shared = ApiManager.init()
    var delegate: ApiManagerDelegateProtocol?
    
    func fetchApiJSON (){
        do {
            let parsingData = try JSONDecoder().decode([JSONData].self, from: jsonData.data(using: .utf8)!)
            //call func sendDATa
            self.delegate?.sendData(arr: parsingData)
            
        } catch
        {
            print(error)
        }
    
    }
    
    func fetchClosure(completionHandler: ([JSONData]) -> ()){
        do {
            let parsingData = try JSONDecoder().decode([JSONData].self, from: jsonData.data(using: .utf8)!)
            //call func sendDATa
            //self.delegate?.sendData(arr: parsingData)
            completionHandler(parsingData)
            
        } catch
        {
            print(error)
        }
    }
    
    func fetchClosureEscaping(completionHandler: @escaping ([JSONData]) -> ()){
        do {
            let parsingData = try JSONDecoder().decode([JSONData].self, from: jsonData.data(using: .utf8)!)
            //call func sendDATa
            //self.delegate?.sendData(arr: parsingData)
            completionHandler(parsingData)
            
        } catch
        {
            print(error)
        }
    }
    
    
    func fetchApi(url: String){
        guard let urlRequest = URL(string: url) else { return}
        URLSession.shared.dataTask(with: urlRequest) {
            data, urlReponse, error in
            if data == nil || error != nil {
                print(error ?? "error getting data")
                
            } else {
                do {
                    let parsingData = try JSONDecoder().decode([JSONData].self, from: data!)
                    //call func sendDATa
                    self.delegate?.sendData(arr: parsingData)
                    
                } catch
                {
                    print(error)
                }
            }
        }
    }
}


//send data to View Model

protocol ApiManagerDelegateProtocol{
    func sendData(arr: [JSONData])
}
