//
//  APICaller.swift
//  APIKit
//
//  Created by Hanh Vo on 1/30/23.
//

import Foundation


public class APICaller {
    
    
    static let shared = APICaller()
    private init () {}
    public func fetchCourseNames(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
        }.resume()
}

