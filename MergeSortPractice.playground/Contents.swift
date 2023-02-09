import UIKit

var greeting = "Hello, playground"

struct Merging {
    
    func mergesort(_ a: [Int]) -> [Int] {
        guard a.count > 1 else {
            return a
        }
        var low = 0
        var high = a.count - 1
        
        var middle = (high - low)/2
        
        let left = mergesort(Array(a[0...middle]))
        let right = mergesort(Array(a[middle+1...high]))
        return merge(left,right)
    }
    
    func merge(_ a: [Int],_ b: [Int]) -> [Int] {
        var i = 0
        var j = 0
        
        var resultArray: [Int] = []
        resultArray.reserveCapacity(a.count+b.count+1)
        
        while i != a.count && j != b.count {
            if a[i] < b[j] {
                resultArray.append(a[i])
                i += 1
            } else if a[i] > b[j] {
                resultArray.append(b[j])
                j += 1
            } else {
                resultArray.append(a[i])
                resultArray.append(b[j])
                i += 1
                j += 1
            }
        }
        
        while i != a.count {
            resultArray.append(a[i])
            i += 1
        }
        
        while j != b.count {
            resultArray.append(b[j])
            j += 1
        }
        
        return resultArray
    }
}

let obj = Merging()
let testArray = [4,3,8,2,1]
let result = obj.mergesort(testArray)
print(result)
