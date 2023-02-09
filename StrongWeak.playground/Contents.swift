import UIKit
import Foundation


var greeting = "Hello, playground"



class Employee {
    var name: String
    var id: String
    
    //var job: Job? = nil
    
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
        
        print(self.name)
    }
    
    deinit {
        debugPrint("Employee instacne deleted")
    }
}

class Job {
    var jobName: String
    var jobId: String
    
    //weak var person: Employee? = nil
    
    init(jobName: String,jobId: String) {
        self.jobName = jobName
        self.jobId = jobId
        
        print(self.jobName)
    }
    
    deinit {
        print("Job instance deleted")
    }
}

var employee: Employee?
var job: Job?

employee = Employee(name: "Raj", id: "1")
job = Job(jobName: "Developer", jobId: "121")



//var s = "sudipta"
//
//var inputArray = Array(s)
//
//var start = 0
//var end = inputArray.count - 1
//
//while start < end {
//    var first = inputArray[start]
//    var second = inputArray[end]
//    swap(&first, &second)
//    inputArray[start] = first
//    inputArray[end] = second
//    start += 1
//    end -= 1
//}
//
//func swap(_ a: inout Character, _ b: inout Character) {
//    var c = a
//    a = b
//    b = c
//}
//
//let str = String(inputArray)
//print(str)

//func reverseWord<T>(_ input: [T]) -> [T] {
//    var inputArray = Array(input)
//
//    var start = 0
//    var end = inputArray.count - 1
//
//    while start < end {
//        var first = inputArray[start]
//        var second = inputArray[end]
//        swap(&first, &second)
//        inputArray[start] = first
//        inputArray[end] = second
//        start += 1
//        end -= 1
//    }
//    return inputArray
//}
//
//print("Please enter data")
//var s = (readLine())
//var input = ""
//if s is String {
//    print("string")
//    input = s ?? ""
//} else {
//    input = s ?? ""
//}
//var inputArray = Array(input)
//var outputArray = reverseWord(inputArray)
//var output = String(outputArray)
//print(output)

print("Enter you name : ", terminator: "")
if let input = readLine() {
    print("Hello \(input)!")
}





