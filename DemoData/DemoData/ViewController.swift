//
//  ViewController.swift
//  DemoData
//
//  Created by Hanh Vo on 1/31/23.
//

import UIKit



class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}



class ViewController: UIViewController {
    var john: Person? = Person(name: "John Appleseed")
    var unit4A: Apartment? = Apartment(unit: "4A")
    override func viewDidLoad() {
        john!.apartment = unit4A
        unit4A!.tenant = john
        john = nil
        unit4A = nil
        unit4A.ten
    }
    
}




