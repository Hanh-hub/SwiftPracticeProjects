//
//  ViewController.swift
//  RetainCycle
//
//  Created by Hanh Vo on 2/25/23.
//

import UIKit

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        print("\(name) is being initialized")
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
     var customer: Customer
    init(number: UInt64, customer: Customer) {
        print("Card \(number) is being innitialized ")
        self.number = number
        self.customer = customer
    }
    func detachCustomer() {
            self.customer = Customer(name: "")
        }
    deinit { print("Card #\(number) is being deinitialized") }
}



//print(Unmanaged.passUnretained(john!).toOpaque())


class ViewController: UIViewController {
    var john: Customer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        john = Customer(name: " John nguyeb")

        john?.card = CreditCard(number: 123456, customer: john!)

   john = nil
        // Do any additional setup after loading the view.
    }
    

}

