import UIKit

var greeting = "Hello, playground"


struct multiplier {
    let multiplier: Int
    
    subscript(number: Int) -> Int {
        return number*multiplier
    }
}

let multiplierbySeven = multiplier(multiplier: 7)

print("seven with 3 is \(multiplierbySeven[3])")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

