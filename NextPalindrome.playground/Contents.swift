import UIKit

var greeting = "Hello, playground"


func generateNextPalindromeUtil(_ num: Int) {
    var resultArray = turnNumIntoArray(num)
    var n = resultArray.count
    
    var mid = n/2
    var i = mid - 1
    
    var j = (n%2 == 0) ? mid : mid+1
    
    var leftSmaller = false
    
    while(i >= 0 && resultArray[i] == resultArray[j]) {
        i -= 1
        j += 1
    }
    
    if (i<0 || resultArray[i] < resultArray[j]) {
        leftSmaller = true
    }
    
    while (i >= 0) {
        resultArray[j] = resultArray[i]
        j = j+1
        i -= 1
    }
}




func generateNextPalindrom(_ num: Int) {
    let resultArray = turnNumIntoArray(num)
    let n = resultArray.count
    if isAll9(num) {
        print(1)
        for _ in 0..<n-1 {
            print(0)
        }
        print(1)
    } else {
        generateNextPalindromeUtil(num)
    }
}

func isAll9(_ num: Int) -> Bool {
    
    let numbers = turnNumIntoArray(num)
    for number in numbers {
        if number != 9 {
            return false
        }
    }
    return true
}


func turnNumIntoArray(_ num: Int)-> [Int] {
    var resultArray: [Int] = []
    var temp = num
    while temp != 0 {
        let input = temp%10
        resultArray.append(input)
        temp = temp/10
    }
    return resultArray.reversed()
}

isAll9(998)

