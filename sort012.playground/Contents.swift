import UIKit

var greeting = "Hello, playground"


var numbers = [0,2,1,2,0]

var countofZero = 0
var countofone = 0
var countoftwo = 0

for i in 0...numbers.count-1 {
    if numbers[i] == 0 {
        countofZero += 1
    }
    if numbers[i] == 1 {
        countofone += 1
    }
    if numbers[i] == 2 {
        countoftwo += 1
    }
}

var result:[Int] = []

for i in 1...countofZero {
    result.append(0)
}

for i in 1...countofone {
    result.append(1)
}

for i in 1...countoftwo {
    result.append(2)
}

print(result)

