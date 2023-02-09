import UIKit

var greeting = "Hello, playground"

var input = [3,2,1]
var outputArray = input.sorted()
for number in outputArray {
    
}

func findDuplicates(_ s: String) {
    
    var input = Array(s)
    var dict: [Character:Int] = [:]
    dict.reserveCapacity(input.count)
    
    
    for char in input {
        dict[char] = 0
    }
    for letters in input {
        var count = 1
        dict[letters] = count + dict[letters]!
    }
    
    for letters in input {
        if dict[letters]! > 1 {
            print(letters)
            break
        }
    }
    
//    for (key,value) in dict {
//        if dict[key]! > 1 {
//            print(key)
//        }
//    }
    
}

var result = "Great responsibility"
findDuplicates(result)


