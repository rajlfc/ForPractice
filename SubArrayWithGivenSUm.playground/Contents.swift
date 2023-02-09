import UIKit

var greeting = "Hello, playground"

var numbers = [1,2,3,7,5]
var S = 12

var currrentSum = numbers[0]
var start = 0

for i in 1...numbers.count {
    
    while currrentSum < S && start < i-1 {
        currrentSum = currrentSum-numbers[start]
        start += 1
    }
    
    if i < numbers.count {
        currrentSum = currrentSum + numbers[i]
    }
}


/// Have to complete the above code

