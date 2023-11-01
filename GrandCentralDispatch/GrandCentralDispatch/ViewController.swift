//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Hanh Vo on 1/17/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //serialQueues()
        concurrentQueues()
        //concurentQueues()
        //deadlockDemo()
    }
    
    func serialQueues() {
        let serialQueu = DispatchQueue(label: "com.multithreading.serialQueue", qos: .utility)
        serialQueu.async {
            print("task 1 begin serial")
            self.task1()
            print("task 1 finished serial")
        }
        serialQueu.async {
            print("task 2 begin")
            self.task2()
            print("task 2 finished")
        }
    }
    
    func concurentQueues(){
        let concurrentQueue = DispatchQueue(label: "com.multithreading.concurrentlQueue",qos: .utility, attributes: .concurrent)
        concurrentQueue.async{
            print("task 1 begin concurrent")
            self.task1()
            print("task 1 finished concurrent")
        }
        concurrentQueue.async {
            print("task 2 begin concurrent")
            self.task2()
            print("task 2 finished")
        }
            
        
    }
    
    func concurrentQueues(){
           let anotherQueue = DispatchQueue(label: "com.multithreading.concurr", qos: .utility, attributes: .concurrent)
           anotherQueue.async {
               for i in 0..<30{
                   print("🏓",i)
               }
           }
           anotherQueue.async {
               for i in 100..<120{
                   print("⚽️",i)
               }
           }
           anotherQueue.async {
               for i in 1000..<1020{
                   print("📘",i)
               }
           }
       }
    
    func deadlockDemo() {
        let queu1 = DispatchQueue(label: "queee1")
        let queu2 = DispatchQueue(label: "queee2")
        
        queu1.sync{
            print("Task 1 has start on queue 1")
            self.task1()
            queu2.sync {
                print("task 2 has started on queue 2")
                task2()
                print("task 2 has finished on queue 2")
            }
            print("task 1 has completed on queue 1")
        }
    }
    
    

    func task1(){
        for i in 0..<30 {
            print("task 1 🏓 ",i)
        }
    }
    func task2(){
        for i in 31..<100 {
            print("task 2 ⚽️ ",i)
        }
    }


}

