//
//  ViewController.swift
//  ClosureDemo
//
//  Created by Hanh Vo on 1/17/23.
//

import UIKit

struct Schedule : Codable {
    let rocket : String?
    let success : Bool?
    let details : String?
    let name : String?
    let date_utc : String?
    let upcoming : Bool?
}
class A{
    var a: Int = 5
    var b: Int = 6
    
    func Sum(a: Int, b: Int){
        print(a+b)
        
    }
}



class ViewController: UIViewController {
    let url = "https://api.spacexdata.com/v5/launches"
    var scheduleArray = [Schedule]()

    override func viewDidLoad() {
        super.viewDidLoad()
        var objA = A()
        objA.a = 7
        objA.b = 9
        
        
        
        //fetchData(url: url)
        fetchDataWithClosure(url: url){ data, error in
            //            if let data = data {
            //                print(data)
            //                do {
            //                    let parsingData = try JSONDecoder().decode([Schedule].self, from: data)
            //                    print(parsingData)
            //                }
            //                catch{
            //                    print(error)
            //                }
            
            //   }
            //            else{
            //                print(error!)
            //            }
            // }
            
            // Do any additional setup after loading the view.
        }
    }
   
    func fetchData(url: String) {
        print("perfoming")
        
        guard let url = URL(string: url) else {
            print("Cant get url")
            return }
       
        
        let objUrlRequest = URLRequest(url: url)
               
       URLSession.shared.dataTask(with: objUrlRequest) {
            data, response, error in
            if data == nil || error != nil {
            print("Fetching data from server encountered error , \(String(describing: error?.localizedDescription))")
            
                return
                    }
                       
        do {
            print("do")
            let parsingData = try JSONDecoder().decode([Schedule].self, from: data!)
            self.scheduleArray = parsingData
            print("fetch sucessfully", self.scheduleArray)
            }catch {
                print(error)
                
            }
           
       }.resume()
        
    }
    
    
    func fetchDataWithClosure(url: String, completion: @escaping(Data?, Error?) ->Void ) {
        let url = URL(string: url)
        let objUrlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: objUrlRequest){
            data, response, error in
            if data == nil || error != nil {
            print("Fetching data from server encountered error , \(String(describing: error?.localizedDescription))")
                completion(nil, error!)
                return
                    }
                       
        do {
            print("do")
            let parsingData = try JSONDecoder().decode([Schedule].self, from: data!)
            //self.scheduleArray = parsingData
            //print("fetch sucessfully", self.scheduleArray)
            completion(data, nil)
            }catch {
                //print(error)
                completion(nil, error)
                
            }
           
        }.resume()
        
    }
        
        



   




}

