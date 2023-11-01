//
//  ViewModel.swift
//  SDWebImageDemo
//
//  Created by Hanh Vo on 4/10/23.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

//class ViewModel {
//   var products = [Product]()
//    private(set) var products = BehaviorRelay(value: [Product]())
//    func getData(completion: @escaping () -> Void){
//        ApiClient.shared.fetchApi(url: baseUrl){ result in
//            switch result {
//            case .success( let products):
//                self.products = products
//                completion()
//            case .failure(let error):
//                print(error.localizedDescription)
//
//            }
//
//        }
//    }
//
//}


//
//class ViewModel {
//    // Use BehaviorRelay to hold products and have an initial value
//    private(set) var products = BehaviorRelay(value: [Product]())
//
//    // Create a disposeBag to handle memory management
//    private let disposeBag = DisposeBag()
//
//    func getData() {
//        ApiClient.shared.fetchApi(url: baseUrl)
//            .subscribe(onNext: { [weak self] products in
//                self?.products.accept(products)
//            }, onError: { error in
//                print(error.localizedDescription)
//            })
//            .disposed(by: disposeBag)
//    }
//}



//class ViewModel {
//    // Use BehaviorRelay to hold products and have an initial value
//    private(set) var products = BehaviorRelay(value: [Product]())
//
//    // Create a disposeBag to handle memory management
//    private let disposeBag = DisposeBag()
//
//    func getData() {
//        ApiClient.shared.fetchApi(url: "https://your-api-url.com/products") { [weak self] result in
//            switch result {
//            case .success(let products):
//                // Update the products relay with the new data
//                self?.products.accept(products)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}




//class ViewModel {
//    // Use BehaviorRelay to hold products and have an initial value
//    private(set) var products = BehaviorRelay(value: [Product]())
//
//
//    // Create a disposeBag to handle memory management
//    private let disposeBag = DisposeBag()
//
//    func getData() -> Observable<[Product]> {
//        return Observable.create { [weak self] observer in
//            ApiClient.shared.fetchApi(url: baseUrl) { result in
//                switch result {
//                case .success(let products):
//                    // Update the products relay with the new data
//                    self?.products.accept(products)
//                    // Emit the new data
//                    observer.onNext(products)
//                case .failure(let error):
//                    // Emit the error
//                    observer.onError(error)
//                }
//            }
//            // Return a disposable to be used by the disposeBag
//            return Disposables.create()
//        }
//    }
//}


class ViewModel {
    let items = PublishSubject<[Product]>()
    func getData() {
        ApiClient.shared.fetchApi(url: baseUrl){ [self] result in
            switch result {
            case .success(let products):
                // Emit the new data
                self.items.onNext(products)
                items.onCompleted()
            case .failure(let error):
                // Emit the error
                items.onError(error)
            }
        }
    }
    
}


private class MyClass {
    public var myPublicVariable: String = "Hello, world!"
}

class AnotherClass {
    func exampleFunction() {
        let myObject = MyClass()
        print(myObject.myPublicVariable) // Accessible within the same file
    }
}
