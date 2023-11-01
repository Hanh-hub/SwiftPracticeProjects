//: [Previous](@previous)
import Foundation

let dispatchGroup = DispatchGroup()

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

// Wrap API calls with dispatch group tasks and dispatch queue
dispatchGroup.enter()
DispatchQueue.global().async {
     apiCall1 {
        dispatchGroup.leave()
    }
}

dispatchGroup.enter()
DispatchQueue.global().async {
    apiCall2 {
        dispatchGroup.leave()
    }
}

// Use the notify method to schedule a closure that executes when all tasks have finished
dispatchGroup.notify(queue: .main) {
    print("All API calls completed")
}

