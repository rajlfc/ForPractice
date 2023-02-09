import UIKit

var greeting = "Hello, playground"


/// https://www.geeksforgeeks.org/find-elements-present-first-array-not-second/


var input1 = [1, 2, 3, 4, 5, 10]
var input2 = [2, 3, 1, 0, 5]

var setinput2 = Set(input2)

for number in input1 {
    if !setinput2.contains(number) {
        print(number)
    }
}
