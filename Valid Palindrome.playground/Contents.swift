import UIKit

var greeting = "Hello, playground"


final class ValidPalindrome {
    
    static func isPalindrome(_ s: String) -> Bool {
        
        guard !s.isEmpty else {
            return true
        }
        
        var updatedString: String = ""
        
        for character in s {
            if character.isNumber || character.isLetter {
                updatedString += String(character)
            }
        }
        
        guard !updatedString.isEmpty else {
            return true
        }
        
        updatedString = updatedString.lowercased()
        
        var startPointer : Int = 0
        var endPointer: Int = updatedString.count - 1
        
        while startPointer <= endPointer {
            
            let startCharIndex = updatedString.startIndex
            let startIndex = updatedString.index(startCharIndex, offsetBy: startPointer)
            let endIndex = updatedString.index(startCharIndex, offsetBy: endPointer)
            
            if updatedString[startIndex] != updatedString[endIndex] {
                return false
            }
            
            startPointer += 1
            endPointer -= 1
        }
       return true
    }
}

let isPalindrom = ValidPalindrome.isPalindrome("A man, a plan, a canal: Panama")
print(isPalindrom)
