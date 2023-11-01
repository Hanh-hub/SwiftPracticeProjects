//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
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

let customQueue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)
print("before custom queue")
customQueue.async {
    apiCall1 { }
}
print("inside custom queue")
customQueue.async {
    apiCall2 { }
}
print("after custom queue")



