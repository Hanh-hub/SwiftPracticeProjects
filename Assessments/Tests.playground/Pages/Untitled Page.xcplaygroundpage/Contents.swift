import UIKit


//let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)
//
//func firstApiCall(){
//    sleep(5)
//    print("finish first apiCall")
//}
//
//func secondApiCall(){
//    sleep(5)
//    print("finish second apiCall")
//}
//
//print("before dispatch")
//
//queue.sync {
//    firstApiCall()
//}
//print("-------")
//
//queue.sync {
//    secondApiCall()
//}
//print("after dispatch")



func apiCall1(completion: @escaping () -> Void) {
    // Simulate API call delay
    sleep(2)
    print("API call 1 completed")
    completion()
}

func apiCall2(completion: @escaping () -> Void) {
    // Simulate API call delay
    sleep(2)
    print("API call 2 completed")
    completion()
}

//DispatchQueue.global().async {
//    apiCall1{}
//}
//
//DispatchQueue.global().async {
//    apiCall2{}
//}

//let customQueue = DispatchQueue(label: "com.example.queue")
//print("before custom queue")
//customQueue.async {
//    apiCall1 { }
//}
//print("inside custom queue")
//customQueue.async {
//    apiCall2 { }
//}
//print("after custom queue")



//let group2 = DispatchGroup()
//let queue2 = DispatchQueue(label: "com.example.queue", attributes: .concurrent)
//
//queue2.async(group: group2) {
//    apiCall1 {
//    }
//}
//
//queue2.async(group: group2) {
//    apiCall2 {
//
//    }
//}
//
//group2.notify(queue: .main) {
//    print("All API calls completed")
//}


let queue = DispatchQueue.global()

let workItem = DispatchWorkItem {
    for i in 0..<10 {
        if workItem.isCancelled {
            break
        }
        sleep(1)
        print("DispatchWorkItem: \(i)")
    }
}

queue.async(execute: workItem)

DispatchQueue.global().asyncAfter(deadline: .now() + 8) {
    workItem.cancel()
}

// This will output:
// DispatchWorkItem: 0
// DispatchWorkItem: 1
// DispatchWorkItem: 2
// ... and may continue to 9 even after cancelling the workItem.


let operationQueue = OperationQueue()

let operation = BlockOperation {
    for i in 0..<10 {
        if operation.isCancelled {
            break
        }
        sleep(1)
        print("Operation: \(i)")
    }
}

operationQueue.addOperation(operation)

DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
    operation.cancel()
}

// This will output:
// Operation: 0
// Operation: 1
// Operation: 2
// ... and will stop after cancelling the operation.
