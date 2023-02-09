import UIKit

var greeting = "Hello, playground"


protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable{}
extension String: Addable{}


func sumOfIntegers<T: Addable>(_ number1: T, _number2: T) -> T {
    return number1 + _number2
}

let c = sumOfIntegers("Sudipta " , _number2: "Bhattacharjee")
print(c)

