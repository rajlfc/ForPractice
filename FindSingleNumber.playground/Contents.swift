import UIKit

var greeting = "Hello, playground"

//var inputArray = [2,2,1,5,1]
//
//var dict: [Int:Int] = [:]
//var count = 1
//
//for number in inputArray {
//
//    dict[number] = 0
//}
//
//for number in inputArray {
//    for (key,value) in dict {
//        if key == number {
//            dict[key] = value + count
//        }
//    }
//}
//
//for (key,value) in dict {
//    if dict[key] == 1 {
//        print(key)
//    }
//}

//var inputArray = [1,2,3]
//var outputArray = [Int]()
//
//var lastIndex = inputArray.count - 1
//
//while (lastIndex != -1) {
//    outputArray.append(inputArray[lastIndex])
//    lastIndex -= 1
//}
//
//print(outputArray)


//func returnTwoValues() -> (Int,Int) {
//    return (1,2)
//}
//
//var outputTuple = returnTwoValues()
//
//print(outputTuple.0)///1
//print(outputTuple.1)///2

enum moveDirection: String {
    case North
    case East
    case South
    case West
}


//func turnTo(direction: String) {
//
//    switch direction {
//    case moveDirection.North.rawValue:
//        northAction()
//    case moveDirection.East.rawValue:
//        eastAction()
//    case moveDirection.South.rawValue:
//        southAction()
//    case moveDirection.West.rawValue:
//        westAction()
//    default:
//        print("No valid direction specified")
//    }
//}


//class A {
//    func doNumber1() {
//
//    }
//    func doNumber2() {
//
//    }
//}
//
//extension A {
//    func doNumber3() {
//
//    }
//}
//
//let a = A()
//a.doNumber3()


var number: Int?

number = 5
 
print(number!)

