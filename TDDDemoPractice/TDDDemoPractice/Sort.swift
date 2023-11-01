//
//  Sort.swift
//  TDDDemoPractice
//
//  Created by Hanh Vo on 1/19/23.
//


import Foundation

struct Calculator  {
   
    func sum<T:Sum>(n1:T?, n2:T?) -> T? {
        guard let n1 = n1, let n2 = n2 else {
            return nil
        }
        return n1 + n2
    }
  
    func sub<T:Sub>(n1:T?, n2:T?) -> T? {
        guard let n1 = n1, let n2 = n2 else {
            return nil
        }
        return n1 - n2
    }
}



class SortedSet<T:Sum>{
    private var arr: [T] = []
    
    func AddElement(_ element :T){
        for i in 0 ..< arr.count{
            if element == arr[i]{
                return
            }
            if element < arr[i]{
                arr.insert(element, at: i)
                return
            }
        }
        arr.append(element)
    }
    
    func AddSeveralElements(_ elements :[T]){
        for i in elements{
            AddElement(i)
        }
    }
    
    func Count()-> Int {
        return arr.count
    }
    
    func GetElementAt(_ index :Int)-> T?{
        if index < arr.count{
            return arr[index]
        }
        return nil
    }
    func Exist(_ element :T)->Bool{
        for i in arr{
            if element == i{
                return true
            }
        }
        return false
    }
    func GetMaximum()->T?{
        if arr.count == 0{
            return nil
        }
        return arr[arr.count - 1]
    }
    func GetMinimum()->T?{
        if arr.count == 0{
            return nil
        }
        return arr[0]
    }
    
    func AddAll()-> T? {
        if arr.count == 0{
            return nil
        }
        var temp = arr[0]
        for i in 1 ..< arr.count{
            temp  = temp + arr[i]
        }
        return temp
    }
    
    func RemoveElementAtIndex(_ index :Int){
        if index >= arr.count{
            return
        }
        arr.remove(at: index)
    }
    
    func RemoveElement(_ element :T){
        guard let i = GetIndex(element) else {return}
        RemoveElementAtIndex(i)
    }
    
    func RemoveAll(){
        arr.removeAll()
    }
    
    func GetIndex(_ element: T)-> Int?{
        for i in 0 ..< arr.count{
            if arr[i] == element{
                return i
            }
        }
        return nil
    }
    
    func IsEmpty()-> Bool{
        if Count() == 0{
            return true
        }
        return false
    }
    
    subscript(index: Int) -> T?{
        return GetElementAt(index)
    }
    
    
}
//
protocol Sum: Comparable {
    static func +(lhs:Self, rhs: Self)-> Self
}

protocol Sub: Comparable {
    static func -(lhs:Self, rhs: Self)-> Self
}
extension Int: Sum{}
extension Int: Sub{}
